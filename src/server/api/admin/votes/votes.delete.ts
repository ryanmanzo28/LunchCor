import { getPool } from '~/server/utils/db'
import { verifyAdminCredentials } from '~/server/utils/adminAuth'

interface VoteRequestBody {
  userId: number
  password: string
}

export default defineEventHandler(async (event) => {
  const body = await readBody<VoteRequestBody>(event)

  if (!body?.userId || !body?.password) {
    throw createError({
      statusCode: 400,
      statusMessage: 'userId and password are required',
    })
  }

  const admin = await verifyAdminCredentials(body.userId, body.password)

  if (admin) {
    // Clear vote records and reset denormalized counters together.
    const pool = getPool()
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