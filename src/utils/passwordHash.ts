import bcrypt from 'bcrypt'

// Keep rounds moderate for local/dev responsiveness while preserving basic security.
const BCRYPT_ROUNDS = 10

export function hashPassword(password: string): Promise<string> {
    return bcrypt.hash(password, BCRYPT_ROUNDS)
}

export function verifyPassword(password: string, hash: string): Promise<boolean> {
    return bcrypt.compare(password, hash)
}