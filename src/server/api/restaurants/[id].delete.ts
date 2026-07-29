import { deleteRestaurant } from './utils'

export default defineEventHandler(async (event) => {
  const id = Number(getRouterParam(event, 'id'))

  if (!Number.isInteger(id) || id <= 0) {
    throw createError({
      statusCode: 400,
      statusMessage: 'A valid restaurant id is required',
    })
  }

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
