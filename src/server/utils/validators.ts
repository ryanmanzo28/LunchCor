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

export async function isValidEmail(email: string): Promise<boolean> {
  const normalizedEmail = email.trim().toLowerCase()
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/

  if (!emailRegex.test(normalizedEmail)) {
    return false
  }

  const pool = getPool()
  const [rows] = await pool.query<Array<mysql.RowDataPacket & { id: number }>>(
    'SELECT id FROM users WHERE LOWER(email) = ? LIMIT 1',
    [normalizedEmail],
  )

  return rows.length === 0
}

export function isValidPassword(password: string): boolean {
  return password.length >= 8
}
