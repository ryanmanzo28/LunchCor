import { deleteRestaurant } from '~/server/utils/restaurants'
import { verifyAdminCredentials } from '~/server/utils/adminAuth'

interface AdminRestaurantDeleteQuery {
  id: number
  password: string
}

export default defineEventHandler(async (event) => {
  const query = getQuery(event) as AdminRestaurantDeleteQuery
  const id = Number(query.id)

  if (!Number.isInteger(id) || id <= 0) {
    throw createError({
      statusCode: 400,
      statusMessage: 'A valid restaurant id is required',
    })
  }

  await verifyAdminCredentials(query.id, query.password)

  const removed = await deleteRestaurant(id)

  if (!removed) {
    throw createError({
      statusCode: 404,
      statusMessage: 'Restaurant not found',
    })
  }

  return {
    status: 'deleted',
    id,
  }
})
