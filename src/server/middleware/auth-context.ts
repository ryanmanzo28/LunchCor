import { defineEventHandler, getCookie } from 'h3'
import { decodeId } from '../../utils/jwtVerify'

export default defineEventHandler(async (event) => {
  const token = getCookie(event, 'jwt') || null
  const isAuth = Boolean(token)
  let id: number | null = null

  if (token) {
    try {
      id = await decodeId(token)
    }
    catch {
      id = null
    }
  }

  const admin = getCookie(event, 'admin') === 'true' ? true : false

  // Attach normalized auth context so downstream handlers can authorize consistently.
  event.context.auth = {
    token,
    isAuthenticated: isAuth,
    id,
    isAdmin: admin
  }
})