import { SignJWT, jwtVerify, type JWTPayload } from 'jose'

interface JwtPayload extends JWTPayload {
  id: number
  email: string
  admin: boolean
}

function getJwtSecret() {
  const secret = process.env.JWT_SECRET

  if (!secret) {
    throw createError({
      statusCode: 500,
      statusMessage: 'JWT secret is not configured',
    })
  }

  return new TextEncoder().encode(secret)
}

export async function signJwt(payload: JwtPayload, expiresIn: string = '1d') {
  return await new SignJWT(payload)
    .setProtectedHeader({ alg: 'HS256' })
    .setIssuedAt()
    .setExpirationTime(expiresIn)
    .sign(getJwtSecret())
}

export async function verifyJwt(token: string) {
  const { payload } = await jwtVerify(token, getJwtSecret())

  const id = Number(payload.id)
  const email = typeof payload.email === 'string' ? payload.email : ''
  const admin = Boolean(payload.admin)

  if (!id || !email) {
    throw createError({
      statusCode: 401,
      statusMessage: 'Invalid token payload',
    })
  }

  return {
    ...payload,
    id,
    email,
    admin,
  } satisfies JwtPayload
}
