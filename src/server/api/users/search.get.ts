import mysql from 'mysql2/promise'
import { getPool } from '~/server/utils/db'

interface SearchUserRow extends mysql.RowDataPacket {
  id: number
  name: string
  email: string
  admin: number | boolean
}

export default defineEventHandler(async (event) => {
  if (!event.context.auth?.isAuthenticated) {
    throw createError({
      statusCode: 401,
      statusMessage: 'Authentication required',
    })
  }

  const q = String(getQuery(event).q ?? '').trim()

  if (!q) {
    return []
  }

  const like = `%${q}%`
  const pool = getPool()
  const [rows] = await pool.query<SearchUserRow[]>(
    `SELECT id, name, email, admin
     FROM users
     WHERE name LIKE ? OR email LIKE ?
     ORDER BY name ASC
     LIMIT 20`,
    [like, like],
  )

  return rows.map((row) => ({
    id: row.id,
    name: row.name,
    email: row.email,
    admin: Boolean(row.admin),
  }))
})