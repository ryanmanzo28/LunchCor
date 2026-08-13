import { listRestaurantReviews } from '~/server/utils/restaurantReviews'

export default defineEventHandler(async (event) => {
  const id = Number(getRouterParam(event, 'id'))

  if (!Number.isInteger(id) || id <= 0) {
    throw createError({
      statusCode: 400,
      statusMessage: 'A valid restaurant id is required',
    })
  }

  try {
    const summary = await listRestaurantReviews(id)

    return {
      restaurantId: id,
      averageRating: summary.averageRating,
      totalReviews: summary.totalReviews,
      reviews: summary.reviews,
    }
  }
  catch (error) {
    if (error && typeof error === 'object' && 'statusCode' in error) {
      throw error
    }

    throw createError({
      statusCode: 500,
      statusMessage: 'Unable to load reviews',
    })
  }
})
