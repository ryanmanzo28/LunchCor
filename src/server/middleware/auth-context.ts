import { defineEventHandler, getCookie } from 'h3'

export default defineEventHandler((event) => {
  const token = getCookie(event, 'jwt') || null
  const isAuth = Boolean(token)

  event.context.auth = {
    token,
    isAuthenticated: isAuth,
  }
})