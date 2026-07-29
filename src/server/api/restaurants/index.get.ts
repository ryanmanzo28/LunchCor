import { listRestaurants } from './utils'

export default defineEventHandler(async () => {
  try {
    const restaurants = await listRestaurants()

    return {
      status: 'ok',
      count: restaurants.length,
      restaurants,
    }
  }
  catch (error) {
    if (error && typeof error === 'object' && 'statusCode' in error) {
      throw error
    }

    console.error('Failed to list restaurants:', error)
    throw createError({
      statusCode: 500,
      statusMessage: 'Unable to process restaurant request',
    })
  }
})
