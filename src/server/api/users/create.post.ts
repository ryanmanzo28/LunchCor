import mysql from 'mysql2/promise'
import { isValidEmail, isValidPassword } from '../../utils/validators'
import { hashPassword } from '../../../utils/passwordHash'
import { getPool } from '../../utils/db'

interface CreateUserBody {
    name?: string
    email?: string
    password?: string
}

interface UserRow extends mysql.RowDataPacket {
    id: number
    name: string
    email: string
    password: string
    admin: number | boolean
}


export default defineEventHandler(async (event) => {
    const body = await readBody<CreateUserBody>(event)

    if (body.name && body.email && body.password) {
        const name = String(body.name).trim()
        const email = String(body.email).trim().toLowerCase()
        const plainPassword = String(body.password)

        // Validate uniqueness/format before hashing and insert.
        const emailIsAvailable = await isValidEmail(email)
        if (!emailIsAvailable) {
            throw createError({
                statusCode: 409,
                statusMessage: "Email is invalid or already in use"
            })
        }

        if (!isValidPassword(plainPassword)) {
            throw createError({
                statusCode: 400,
                statusMessage: "Password must be at least 8 characters"
            })
        }

        // Never persist plain-text passwords.
        const password = await hashPassword(plainPassword)

        const pool = getPool()
        const [result] = await pool.query<mysql.ResultSetHeader>(
            "INSERT INTO users (name, email, password, admin) VALUES (?, ?, ?, ?)",
            [name, email, password, false]
        )
        const newUserId = result.insertId
        const [rows] = await pool.query<UserRow[]>(
            "SELECT id, name, email, password, admin FROM users WHERE id = ? LIMIT 1",
            [newUserId]
        )
        const newUser = rows[0]
        if (!newUser) {
            throw createError({
                statusCode: 500,
                statusMessage: "Unable to load created user"
            })
        }

        return {
            id: newUser.id,
            name: newUser.name,
            email: newUser.email,
            admin: Boolean(newUser.admin),
        }
    }

    throw createError({
        statusCode: 400,
        statusMessage: "name, email, and password are required"
    })

})