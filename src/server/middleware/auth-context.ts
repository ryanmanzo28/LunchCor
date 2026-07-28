import { defineEventHandler, getCookie } from 'h3'

export default defineEventHandler((event) => {
  const token = getCookie(event, 'jwt') || null
  const isAuth = Boolean(token)
  const id = decodeId(token) || null

  event.context.auth = {
    token,
    isAuthenticated: isAuth,
    id: id
  }
})