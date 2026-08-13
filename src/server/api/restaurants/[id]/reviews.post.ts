import mysql from 'mysql2/promise'
import { createRestaurantReview } from '~/server/utils/restaurantReviews'
import { getPool } from '~/server/utils/db'

interface RestaurantReviewBody {
  rating: number
  review?: string
}

export default defineEventHandler(async (event) => {
  if (!event.context.auth?.isAuthenticated || !event.context.auth.id) {
    throw createError({
      statusCode: 401,
      statusMessage: 'Authentication required',
    })
  }

  const restaurantId = Number(getRouterParam(event, 'id'))
  if (!Number.isInteger(restaurantId) || restaurantId <= 0) {
    throw createError({
      statusCode: 400,
      statusMessage: 'A valid restaurant id is required',
    })
  }

  const body = await readBody<RestaurantReviewBody>(event)
  const rating = Number(body?.rating)
  const review = typeof body?.review === 'string' ? body.review.trim() : ''

  if (!Number.isInteger(rating) || rating < 1 || rating > 5) {
    throw createError({
      statusCode: 400,
      statusMessage: 'rating must be an integer from 1 to 5',
    })
  }

  if (review.length > 1000) {
    throw createError({
      statusCode: 400,
      statusMessage: 'review must be 1000 characters or fewer',
    })
  }

  const pool = getPool()
  const [restaurantRows] = await pool.query<Array<mysql.RowDataPacket>>(
    'SELECT id FROM restaurants WHERE id = ? AND active = TRUE LIMIT 1',
    [restaurantId],
  )

  if (!restaurantRows.length) {
    throw createError({
      statusCode: 404,
      statusMessage: 'Restaurant not found',
    })
  }

  try {
    const result = await createRestaurantReview({
      restaurantId,
      userId: Number(event.context.auth.id),
      rating,
      review,
    })

    return {
      success: true,
      averageRating: result.averageRating,
      message: 'Review submitted',
    }
  }
  catch (error: any) {
    if (error?.code === 'ER_DUP_ENTRY') {
      throw createError({
        statusCode: 409,
        statusMessage: 'You already reviewed this restaurant today',
      })
    }

    if (error && typeof error === 'object' && 'statusCode' in error) {
      throw error
    }

    throw createError({
      statusCode: 500,
      statusMessage: 'Unable to submit review',
    })
  }
})
