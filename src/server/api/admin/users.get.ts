import { getPool } from '~/server/utils/db'
import { verifyAdminCredentials } from '~/server/utils/adminAuth'

interface GetUsersQuery {
    id: number
    password: string
}

defineEventHandler(async (event) => {
    const query = getQuery(event) as GetUsersQuery
    const pool = getPool()
    if (!query.id || isNaN(query.id)) {
        throw createError({
            statusCode: 400,
            statusMessage: 'Invalid user ID',
        })
    }
    const admin = await verifyAdminCredentials(query.id, query.password)
    if (admin) {
        const [rows] = await pool.query(
            'SELECT id, name, email, admin FROM users',
            []
        )
        return rows
    } else {
        throw createError({
            statusCode: 401,
            statusMessage: 'Invalid admin credentials',
        })
    }

})
