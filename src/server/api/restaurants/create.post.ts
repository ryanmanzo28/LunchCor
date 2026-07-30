import { createRestaurant, type RestaurantCreateInput } from '~/server/utils/restaurants'

export default defineEventHandler(async (event) => {
  const body = await readBody<Partial<RestaurantCreateInput>>(event)

  // Keep API contract explicit before invoking DB helpers.
  if (!body?.name?.trim()) {
    throw createError({
      statusCode: 400,
      statusMessage: 'Restaurant name is required',
    })
  }

  if (!body?.link?.trim()) {
    throw createError({
      statusCode: 400,
      statusMessage: 'Restaurant link is required',
    })
  }

  const restaurant = await createRestaurant({
    name: body.name,
    cuisine: body.cuisine,
    description: body.description,
    color: body.color,
    icon: body.icon,
    link: body.link,
  } satisfies RestaurantCreateInput)

  setResponseStatus(event, 201)

  return {
    status: 'created',
    restaurant,
  }
})
