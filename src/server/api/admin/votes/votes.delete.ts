import { getPool } from '~/server/utils/db'
import { verifyAdminCredentials } from '~/server/utils/adminAuth'
import mysql from 'mysql2/promise'

interface VoteRequestBody {
  userId: number
  password: string
}

interface AdminLookupRow extends mysql.RowDataPacket {
  id: number
}

export default defineEventHandler(async (event) => {
  const parsedBody = await readBody<Partial<VoteRequestBody>>(event).catch(() => null)
  const body: Partial<VoteRequestBody> = parsedBody ?? {}
  const pool = getPool()

  let userId = Number(body?.userId)
  let password = body?.password || ''

  // Allow server-side maintenance jobs to use shared env credentials.
  if (!userId || !password) {
    const envAdminUsername = process.env.ADMIN_USERNAME || process.env.ADMIN_EMAIL || process.env.ADMIN_USER || ''
    const envAdminPassword = process.env.ADMIN_PASSWORD || ''

    if (!envAdminUsername || !envAdminPassword) {
      throw createError({
        statusCode: 400,
        statusMessage: 'userId/password or ADMIN_USERNAME+ADMIN_PASSWORD are required',
      })
    }

    const [rows] = await pool.query<AdminLookupRow[]>(
      'SELECT id FROM users WHERE email = ? OR name = ? LIMIT 1',
      [envAdminUsername, envAdminUsername],
    )

    if (!rows[0]?.id) {
      throw createError({
        statusCode: 404,
        statusMessage: 'Configured admin user not found',
      })
    }

    userId = Number(rows[0].id)
    password = envAdminPassword
  }

  const admin = await verifyAdminCredentials(userId, password)

  if (admin) {
    // Clear vote records and reset denormalized counters together.
    await pool.execute('DELETE FROM votes', [])
    await pool.execute('UPDATE restaurants SET votes = 0', [])

    return {
      success: true,
      message: 'All votes have been deleted and restaurant vote counts reset.',
    }
  }

  throw createError({
    statusCode: 403,
    statusMessage: 'Unauthorized',
  })
})