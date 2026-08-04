import { getPool } from '~/server/utils/db'
import { verifyAdminCredentials } from '~/server/utils/adminAuth'

interface GetUsersQuery {
    id: number
    password: string
}

export default defineEventHandler(async (event) => {
    const query = getQuery(event) as GetUsersQuery
    const pool = getPool()
    const adminId = Number(query.id)
    if (!adminId || isNaN(adminId)) {
        throw createError({
            statusCode: 400,
            statusMessage: 'Invalid user ID',
        })
    }
    // Re-authenticate admin on each privileged listing request.
    const admin = await verifyAdminCredentials(adminId, query.password)
    if (admin) {
        const [rows] = await pool.query(
            'SELECT id, name, email, admin FROM users',
            []
        )
        return rows
    } else {
        throw createError({
            statusCode: 401,
            statusMessage: 'Invalid admin credentials',
        })
    }

})
