import { getCookie, createError } from 'h3'
import { verifyJwt } from '~/server/utils/jwt'
import { getPool } from '~/server/db'


export default defineEventHandler(async (event) => {
  const token = getCookie(event, 'jwt')

  if (!token) {
    throw createError({
      statusCode: 401,
      statusMessage: 'Not authenticated',
    })
  }

  let payload

  try {
    payload = verifyJwt(token)
  } catch {
    throw createError({
      statusCode: 401,
      statusMessage: 'Invalid token',
    })
  }
  const pool = getPool()
  const [rows] = await pool.execute(
    'SELECT id, name, email, admin FROM users WHERE id = ? LIMIT 1',
    [payload.id]
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