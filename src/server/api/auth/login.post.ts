import { getPool } from '../../utils/db'
import mysql from 'mysql2/promise'
import { isValidEmail, isValidPassword } from '../../utils/validators'

export default defineEventHandler(async (event) => {
    const {email, password} = await readBody(event)
    const pool = getPool()
    if (isValidEmail(email) && isValidPassword(password)) {
        const [rows] = await pool.query<mysql.RowDataPacket[]>(
            "SELECT id, name, email, password, admin FROM users WHERE email = ? AND password = ? LIMIT 1",
            [email, password]
        )
        const user = rows[0]
        if (!user) {
            throw createError({
                statusCode: 401,
                statusMessage: "Invalid email or password"
            })
        }
        return {
            status: "success",
            user: {
                id: user.id,
                name: user.name,
                email: user.email,
                admin: user.admin
            }
        }
    } else {
        throw createError({
            statusCode: 400,
            statusMessage: "Invalid email or password format"
        })
    }
})