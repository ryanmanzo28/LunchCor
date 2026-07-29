import mysql from 'mysql2/promise'
type MysqlGlobal = typeof globalThis & { __lunchcorPool?: mysql.Pool }

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
    const id = Number(getRouterParam(event, "id"))
    const pool = getPool()
    if (!id || isNaN(id)) {
        throw createError({
            statusCode: 400,
            statusMessage: "Invalid user ID"
        })
    }
    if (!event.context.auth?.isAuthenticated) {
        throw createError({
            statusCode: 401,
            statusMessage: "Authentication required"
        })
    }

    if (Number(event.context.auth.id) !== id) {
        throw createError({
            statusCode: 403,
            statusMessage: "You can only delete your own account"
        })
    }

    const [rows] = await pool.query<UserRow[]>(
        "SELECT id, name, email, password, admin FROM users WHERE id = ? LIMIT 1",
        [id]
    )
    const user = rows[0]

    if (!user) {
        throw createError({
            statusCode: 404,
            statusMessage: "User not found"
        })
    }

    const [result] = await pool.query<mysql.ResultSetHeader>(
        "DELETE FROM users WHERE id = ? LIMIT 1",
        [id]
    )

    if (result.affectedRows === 0) {
        throw createError({
            statusCode: 404,
            statusMessage: "User not found"
        })
    }

    return {
        status: "deleted",
        id,
    }
})