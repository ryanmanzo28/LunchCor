import { getCookie, createError } from 'h3'
import { verifyJwt } from '~/server/utils/jwt'
import mysql from 'mysql2/promise'
import { getPool } from '~/server/utils/db'


export default defineEventHandler(async (event) => {
  const token = getCookie(event, 'jwt')

  if (!token) {
    throw createError({
      statusCode: 401,
      statusMessage: 'Not authenticated',
    })
  }

  let payload: { id: number }

  try {
    payload = await verifyJwt(token)
  } catch {
    throw createError({
      statusCode: 401,
      statusMessage: 'Invalid token',
    })
  }
  const pool = getPool()
  const [rows] = await pool.execute<Array<mysql.RowDataPacket & { id: number; name: string; email: string; admin: number | boolean }>>(
    'SELECT id, name, email, admin FROM users WHERE id = ? LIMIT 1',
    [Number(payload.id)]
  )

  if (rows.length === 0) {
    throw createError({
      statusCode: 401,
      statusMessage: 'User not found',
    })
  }

  return {
    authenticated: true,
    user: rows[0],
  }
})