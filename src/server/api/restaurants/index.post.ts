import { createRestaurant, type RestaurantCreateInput } from '~/server/utils/restaurants'

export default defineEventHandler(async (event) => {
  const body = await readBody<Partial<RestaurantCreateInput>>(event)

  if (!body?.name || !body.name.trim()) {
    throw createError({
      statusCode: 400,
      statusMessage: 'Restaurant name is required',
    })
  }

  const restaurant = await createRestaurant({
    name: body.name,
    cuisine: body.cuisine,
    description: body.description,
    icon: body.icon,
    color: body.color,
  })

  setResponseStatus(event, 201)

  return {
    status: 'created',
    restaurant,
  }
})
