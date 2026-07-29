import mysql from 'mysql2/promise'
import { verifyPassword } from '~/utils/passwordHash'

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

export async function verifyAdminCredentials(id: number, password: string): Promise<boolean> {
  const pool = getPool()
  const [rows] = await pool.query<Array<mysql.RowDataPacket & { password?: string; admin?: number | boolean }>>(
    'SELECT password, admin FROM users WHERE id = ? LIMIT 1',
    [id],
  )

  const user = rows[0]

  if (!user?.password) {
    throw createError({
      statusCode: 404,
      statusMessage: 'User not found',
    })
  }

  const correct = await verifyPassword(password, user.password)

  if (!correct) {
    throw createError({
      statusCode: 401,
      statusMessage: 'Invalid password',
    })
  }

  if (!Boolean(user.admin)) {
    throw createError({
      statusCode: 403,
      statusMessage: 'Admin privileges required',
    })
  }

  return true
}
