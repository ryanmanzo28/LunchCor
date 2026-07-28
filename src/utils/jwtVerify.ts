import { jwtVerify } from 'jose'

export async function decodeId(token: string): Promise<number | null> {
const secret = new TextEncoder().encode(process.env.JWT_SECRET)
const { payload } = await jwtVerify(token, secret)

    return payload.id as number
}

