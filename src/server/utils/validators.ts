import mysql from 'mysql2/promise'
import { getPool } from './db'

export async function isValidEmail(email: string): Promise<boolean> {
  const normalizedEmail = email.trim().toLowerCase()
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/

  // Validate format first, then enforce uniqueness in the users table.
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
