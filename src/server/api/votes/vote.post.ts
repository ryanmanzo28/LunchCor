import mysql from 'mysql2/promise'
import { getPool } from '~/server/utils/db'

interface VoteRequestBody {
  restaurantId: number
}

export default defineEventHandler(async (event) => {
  if (!event.context.auth?.isAuthenticated || !event.context.auth.id) {
    throw createError({
      statusCode: 401,
      statusMessage: 'Authentication required',
    })
  }

  const body = await readBody<VoteRequestBody>(event)
  const userId = Number(event.context.auth.id)

  if (!body?.restaurantId) {
    throw createError({
      statusCode: 400,
      statusMessage: 'restaurantId is required',
    })
  }

  const pool = getPool()

  try {
    // Application-level duplicate check for friendlier 409 responses.
    const [existingVotes] = await pool.query<Array<mysql.RowDataPacket>>(
      'SELECT id FROM votes WHERE user_id = ? LIMIT 1',
      [userId],
    )

    if (existingVotes.length > 0) {
      throw createError({
        statusCode: 409,
        statusMessage: 'User has already cast a vote',
      })
    }

    await pool.execute(
      'INSERT INTO votes (user_id, restaurant_id, vote_date) VALUES (?, ?, CURDATE())',
      [userId, body.restaurantId],
    )

    // Keep denormalized vote counter aligned with inserted vote records.
    await pool.execute(
      'UPDATE restaurants SET votes = votes + 1, times_voted = times_voted + 1 WHERE id = ?',
      [body.restaurantId],
    )

    return { success: true }
  } catch (error: any) {
    if (error?.statusCode === 409) {
      throw error
    }

    if (error?.code === 'ER_DUP_ENTRY') {
      throw createError({
        statusCode: 409,
        statusMessage: 'User has already cast a vote',
      })
    }

    throw createError({
      statusCode: 500,
      statusMessage: 'Unable to record vote',
    })
  }
})
