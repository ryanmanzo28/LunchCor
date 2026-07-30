import mysql from 'mysql2/promise'
import { verifyPassword } from '~/utils/passwordHash'
import { getPool } from '~/server/utils/db'
import { signJwt } from '~/server/utils/jwt'

export default defineEventHandler(async (event) => {
  const { email, password } = await readBody(event)
  const pool = getPool()

  if (email && password) {
    // Perform credential validation against stored hash.
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

    const token = await signJwt({
      id: Number(user.id),
      email: String(user.email),
      admin: Boolean(user.admin),
    })

    setCookie(event, 'jwt', token, {
      path: '/',
      sameSite: 'lax',
      httpOnly: true,
      maxAge: 60 * 60 * 24,
    })

    setCookie(event, 'admin', String(Boolean(user.admin)), {
      path: '/',
      sameSite: 'lax',
      httpOnly: false,
      maxAge: 60 * 60 * 24,
    })

    return {
      status: 'success',
      token,
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