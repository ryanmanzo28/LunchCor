import { createError, defineEventHandler, getRequestURL } from 'h3'

export default defineEventHandler((event) => {
  const method = event.node.req.method || 'GET'
  const url = getRequestURL(event)
  const isRestaurantsCollection = url.pathname === '/api/restaurants'
  const isRestaurantsCreate = url.pathname === '/api/restaurants/create'
  const isRestaurantsItem = /^\/api\/restaurants\/[0-9]+$/.test(url.pathname)

  if (!isRestaurantsCollection && !isRestaurantsCreate && !isRestaurantsItem) {
    return
  }

  if (method === 'POST' || method === 'DELETE') {
    const isAuthenticated = Boolean(event.context.auth?.isAuthenticated)

    if (!isAuthenticated) {
      throw createError({
        statusCode: 401,
        statusMessage: 'Authentication required for restaurant updates',
      })
    }
  }
})