import mysql from 'mysql2/promise'
import { verifyAdminCredentials } from '~/server/utils/adminAuth'
import { getPool } from '~/server/utils/db'

interface AdminAnalyticsQuery {
    id?: string
    password?: string
    startDate?: string
    endDate?: string
    StartDate?: string
    EndDate?: string
}

export default defineEventHandler(async (event) => {
    const query = getQuery(event) as AdminAnalyticsQuery
    const pool = getPool()
    const userId = Number(query.id)
    // Support both camelCase and legacy PascalCase query names.
    const startDate = query.startDate || query.StartDate || ''
    const endDate = query.endDate || query.EndDate || ''

    if (!Number.isInteger(userId) || userId <= 0) {
        throw createError({
            statusCode: 400,
            statusMessage: 'A valid admin user id is required',
        })
    }

    if (!startDate || !endDate) {
        throw createError({
            statusCode: 400,
            statusMessage: 'Start and end dates are required',
        })
    }

    await verifyAdminCredentials(userId, query.password || '')

    const [analyticsRows] = await pool.query<Array<mysql.RowDataPacket>>(
        `SELECT
            r.id AS restaurant_id,
            r.name AS restaurant_name,
            m.id AS meal_id,
            m.name AS meal_name,
            COUNT(*) AS order_count
        FROM orders o
        INNER JOIN restaurants r ON r.id = o.restaurant_id
        INNER JOIN meals m ON m.id = o.meal_id
        WHERE o.order_date BETWEEN ? AND ?
        GROUP BY r.id, r.name, m.id, m.name
        ORDER BY r.name, m.name`,
        [startDate, endDate],
    )

    return {
        startDate,
        endDate,
        analytics: analyticsRows,
    }
})

