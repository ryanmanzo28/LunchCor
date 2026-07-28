import { createError, defineEventHandler, getRequestURL } from 'h3'

export default defineEventHandler((event) => {
  const method = event.node.req.method || 'GET'
  const url = getRequestURL(event)

  if (url.pathname !== '/api/restaurants') {
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