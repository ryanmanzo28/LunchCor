import mysql from 'mysql2/promise'
import type { User } from '@/types/user'
import { getPool } from '~/server/utils/db'

interface UserRow extends mysql.RowDataPacket {
    id: number
    name: string
    email: string
    admin: number | boolean
}

export default defineEventHandler(async (event) => {
    const id = Number(getRouterParam(event, "id"))
    const pool = getPool()
    // Parse and validate route param before querying.
    if (!id || isNaN(id)) {
    throw createError({
        statusCode: 400,
        statusMessage: "Invalid user ID"
    })
}

    if (!event.context.auth?.isAuthenticated) {
        throw createError({
            statusCode: 401,
            statusMessage: 'Authentication required',
        })
    }

    const callerId = Number(event.context.auth.id)
    const isAdmin = Boolean(event.context.auth.isAdmin)
    if (!isAdmin && callerId !== id) {
        throw createError({
            statusCode: 403,
            statusMessage: 'Forbidden',
        })
    }

    const [rows] = await pool.query<UserRow[]>(
        "SELECT id, name, email, admin FROM users WHERE id = ? LIMIT 1",
        [id]
    )
    const user = rows[0]
    if (!user) {
        throw createError({
            statusCode: 404,
            statusMessage: "User not found"
        })
    } else {
        return {
            id: user.id,
            name: user.name,
            email: user.email,
            password: '',
            admin: Boolean(user.admin),
        } satisfies User
    }
})


