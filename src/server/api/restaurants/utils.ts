import mysql from 'mysql2/promise'
import type { Restaurant } from '@/types/restaurant'

type MysqlGlobal = typeof globalThis & { __lunchcorPool?: mysql.Pool }

export interface RestaurantRow extends mysql.RowDataPacket {
  id: number
  name: string
  cuisine: string
  description: string | null
  times_ordered: number
  average_rating: number | string
  icon: string
  color: string
  votes: number
}

export interface RestaurantCreateInput {
  name: string
  cuisine?: string
  description?: string | null
  icon?: string
  color?: string
}

export function getPool() {
  const globalRef = globalThis as MysqlGlobal

  if (!globalRef.__lunchcorPool) {
    globalRef.__lunchcorPool = mysql.createPool({
      host: process.env.DB_HOST || '127.0.0.1',
      port: Number.parseInt(process.env.DB_PORT || '3306', 10),
      user: process.env.DB_USERNAME || 'lunchcor',
      password: process.env.DB_PASSWORD || 'lunchcor',
      database: process.env.DB_DATABASE || 'lunchcor',
      connectionLimit: 10,
    })
  }

  return globalRef.__lunchcorPool
}

export async function hasVotesTable() {
  const pool = getPool()
  const [rows] = await pool.query<Array<mysql.RowDataPacket & { has_table: number }>>(
    `SELECT COUNT(*) AS has_table
     FROM information_schema.tables
     WHERE table_schema = DATABASE()
       AND table_name = 'votes'`,
  )

  return Number(rows[0]?.has_table || 0) > 0
}

export function mapRestaurant(row: RestaurantRow): Restaurant {
  return {
    id: row.id,
    name: row.name,
    cuisine: row.cuisine,
    description: row.description ?? '',
    rating: Number(row.average_rating),
    orders: row.times_ordered,
    votes: row.votes,
    icon: row.icon,
    color: row.color,
  }
}

export async function listRestaurants() {
  const pool = getPool()
  const canUseVotes = await hasVotesTable()
  const query = canUseVotes
    ? `
      SELECT
        r.id,
        r.name,
        r.cuisine,
        r.description,
        r.times_ordered,
        r.average_rating,
        r.icon,
        r.color,
        COALESCE(v.votes, 0) AS votes
      FROM restaurants r
      LEFT JOIN (
        SELECT restaurant_id, COUNT(*) AS votes
        FROM votes
        GROUP BY restaurant_id
      ) v ON v.restaurant_id = r.id
      WHERE r.active = TRUE
      ORDER BY r.name ASC
    `
    : `
      SELECT
        r.id,
        r.name,
        r.cuisine,
        r.description,
        r.times_ordered,
        r.average_rating,
        r.icon,
        r.color,
        0 AS votes
      FROM restaurants r
      WHERE r.active = TRUE
      ORDER BY r.name ASC
    `

  const [rows] = await pool.query<RestaurantRow[]>(query)

  return rows.map(mapRestaurant)
}

export async function createRestaurant(input: RestaurantCreateInput) {
  const pool = getPool()
  const canUseVotes = await hasVotesTable()
  const normalizedName = input.name.trim()
  const fallbackIcon = normalizedName.charAt(0).toUpperCase() || 'R'

  const [result] = await pool.execute<mysql.ResultSetHeader>(
    'INSERT INTO restaurants (name, cuisine, description, icon, color, active) VALUES (?, ?, ?, ?, ?, TRUE)',
    [
      normalizedName,
      input.cuisine?.trim() || 'General',
      input.description ?? null,
      input.icon?.trim() || fallbackIcon,
      input.color?.trim() || '#9aa5b1',
    ],
  )

  await pool.execute(
    `INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, is_available)
     SELECT ?, ?, ?, ?, ?, ?, TRUE
     WHERE NOT EXISTS (
       SELECT 1 FROM menu_items WHERE restaurant_id = ?
     )`,
    [
      result.insertId,
      `${normalizedName} Signature`,
      `Starter menu entry for ${normalizedName}.`,
      'House Special',
      1299,
      'USD',
      result.insertId,
    ],
  )

  const query = canUseVotes
    ? `
      SELECT
        r.id,
        r.name,
        r.cuisine,
        r.description,
        r.times_ordered,
        r.average_rating,
        r.icon,
        r.color,
        COALESCE(v.votes, 0) AS votes
      FROM restaurants r
      LEFT JOIN (
        SELECT restaurant_id, COUNT(*) AS votes
        FROM votes
        GROUP BY restaurant_id
      ) v ON v.restaurant_id = r.id
      WHERE r.id = ?
      LIMIT 1
    `
    : `
      SELECT
        r.id,
        r.name,
        r.cuisine,
        r.description,
        r.times_ordered,
        r.average_rating,
        r.icon,
        r.color,
        0 AS votes
      FROM restaurants r
      WHERE r.id = ?
      LIMIT 1
    `

  const [rows] = await pool.execute<RestaurantRow[]>(query, [result.insertId])
  const created = rows[0]

  if (!created) {
    throw createError({
      statusCode: 500,
      statusMessage: 'Unable to load created restaurant',
    })
  }

  return mapRestaurant(created)
}

export async function deleteRestaurant(id: number) {
  const pool = getPool()
  const [result] = await pool.execute<mysql.ResultSetHeader>(
    'UPDATE restaurants SET active = FALSE WHERE id = ? AND active = TRUE',
    [id],
  )

  return result.affectedRows > 0
}
