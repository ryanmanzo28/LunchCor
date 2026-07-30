import mysql from 'mysql2/promise'
import { getPool } from '~/server/utils/db'

interface AdminPatchInput {
  id: number
  adminPassword: string
}

interface UserAdminRow extends mysql.RowDataPacket {
  admin: number | boolean
}

export default defineEventHandler(async (event) => {
  const body = await readBody<AdminPatchInput>(event)

  if (!Number.isInteger(body.id)) {
    throw createError({
      statusCode: 400,
      statusMessage: 'Invalid user ID',
    })
  }

  const adminPassword = process.env.ADMIN_PASSWORD

  if (!adminPassword) {
    throw createError({
      statusCode: 500,
      statusMessage: 'ADMIN_PASSWORD is not configured',
    })
  }

  if (body.adminPassword !== adminPassword) {
    throw createError({
      statusCode: 401,
      statusMessage: 'Invalid admin password',
    })
  }

  const pool = getPool()
  const [rows] = await pool.query<UserAdminRow[]>(
    'SELECT admin FROM users WHERE id = ? LIMIT 1',
    [body.id],
  )
  const user = rows[0]

  if (!user) {
    throw createError({
      statusCode: 404,
      statusMessage: 'User not found',
    })
  }

  if (Number(user.admin) === 0) {
    await pool.query(
      'UPDATE users SET admin = 1 WHERE id = ?;',
      [body.id],
    )
  }

  return {
    success: true,
  }
})