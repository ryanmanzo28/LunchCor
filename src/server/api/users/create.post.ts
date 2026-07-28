import mysql from 'mysql2/promise'
import type { User } from '@/types/user'
import { isValidEmail, isValidPassword } from '../../utils/validators'
type MysqlGlobal = typeof globalThis & { __lunchcorPool?: mysql.Pool }

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


function getPool() {
	const globalRef = globalThis as MysqlGlobal

	if (!globalRef.__lunchcorPool) {
		globalRef.__lunchcorPool = mysql.createPool({
			host: process.env.DB_HOST || '127.0.0.1',
			port: Number.parseInt(process.env.DB_PORT || '3306', 10),
			user: process.env.DB_USERNAME || 'lunchcor',
			password: process.env.DB_PASSWORD || 'lunchcor',
			database: process.env.DB_DATABASE || 'lunchcor',
			connectionLimit: 10,
		})
	}

	return globalRef.__lunchcorPool
}

export default defineEventHandler(async (event) => {
    const body = await readBody<CreateUserBody>(event)

    if (body.name && body.email && body.password) {
        const name = String(body.name).trim()
        const email = String(body.email).trim().toLowerCase()
        const password = String(body.password)

        const emailIsAvailable = await isValidEmail(email)
        if (!emailIsAvailable) {
            throw createError({
                statusCode: 409,
                statusMessage: "Email is invalid or already in use"
            })
        }

        if (!isValidPassword(password)) {
            throw createError({
                statusCode: 400,
                statusMessage: "Password must be at least 8 characters"
            })
        }

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
            password: newUser.password,
            admin: Boolean(newUser.admin),
        } satisfies User
    }

    throw createError({
        statusCode: 400,
        statusMessage: "name, email, and password are required"
    })

})