import mysql from 'mysql2/promise'
import type User from 'types/user'
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
    const id = Number(getRouterParam(event, "id"))
    const pool = getPool()
    if (!id || isNaN(id)) {
    throw createError({
        statusCode: 400,
        statusMessage: "Invalid user ID"
    })
}
    const [rows] = await pool.query<User[]>(
        "SELECT * FROM users WHERE id = ? LIMIT 1",
        [id]
    )
    const user = rows[0]
    if (!user) {
        throw createError({
            statusCode: 404,
            statusMessage: "User not found"
        })
    } else {
        return user
    }
})


