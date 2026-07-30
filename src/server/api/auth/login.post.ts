import mysql from 'mysql2/promise'
import { verifyPassword } from '~/utils/passwordHash'
import { getPool } from '~/server/utils/db'

export default defineEventHandler(async (event) => {
  const { email, password } = await readBody(event)
  const pool = getPool()

  if (email && password) {
    const [rows] = await pool.query<mysql.RowDataPacket[]>(
      'SELECT id, name, email, password, admin FROM users WHERE email = ? LIMIT 1',
      [email],
    )
    const user = rows[0]

    if (!user) {
      throw createError({
        statusCode: 401,
        statusMessage: 'Invalid email or password',
      })
    }

    const validPassword = await verifyPassword(String(password), String(user.password))
    if (!validPassword) {
      throw createError({
        statusCode: 401,
        statusMessage: 'Invalid email or password',
      })
    }

    return {
      status: 'success',
      user: {
        id: user.id,
        name: user.name,
        email: user.email,
        admin: user.admin,
      },
    }
  }

  throw createError({
    statusCode: 400,
    statusMessage: 'Invalid email or password format',
  })
})