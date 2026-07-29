import mysql from 'mysql2/promise'

type MysqlGlobal = typeof globalThis & { __lunchcorPool?: mysql.Pool }

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
    const { email, password } = await readBody(event)
    const pool = getPool()

    if (email && password) {
        const [rows] = await pool.query<mysql.RowDataPacket[]>(
            'SELECT id, name, email, password, admin FROM users WHERE email = ? AND password = ? LIMIT 1',
            [email, password]
        )
        const user = rows[0]

        if (!user) {
            throw createError({
                statusCode: 401,
                statusMessage: 'Invalid email or password'
            })
        }

        return {
            status: 'success',
            user: {
                id: user.id,
                name: user.name,
                email: user.email,
                admin: user.admin
            }
        }
    }

    throw createError({
        statusCode: 400,
        statusMessage: 'Invalid email or password format'
    })
})