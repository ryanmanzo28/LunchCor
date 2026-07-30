import mysql from 'mysql2/promise'
import { verifyPassword } from '~/utils/passwordHash'
import { getPool } from './db'

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

  // Verify password first, then enforce admin role check.
  const correct = await verifyPassword(password, user.password)

  if (!correct) {
    throw createError({
      statusCode: 401,
      statusMessage: 'Invalid password',
    })
    return false
  }

  if (!Boolean(user.admin)) {
    throw createError({
      statusCode: 403,
      statusMessage: 'Admin privileges required',
    })
    return false
  }

  return true
}
