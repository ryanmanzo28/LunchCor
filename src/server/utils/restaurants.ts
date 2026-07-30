import mysql from 'mysql2/promise'
import type { Restaurant } from '@/types/restaurant'
import { getMenuFromHtml, type MenuItem } from '~/utils/menu'
import { getPool } from './db'

export interface RestaurantRow extends mysql.RowDataPacket {
  id: number
  name: string
  cuisine: string
  description: string | null
  link: string | null
  menu_items_json: string | null
  times_ordered: number
  average_rating: number | string
  icon: string
  color: string
  votes: number
}

export interface RestaurantMenu {
  items: MenuItem[]
}

export interface RestaurantCreateInput {
  name: string
  cuisine?: string
  description?: string | null
  icon?: string
  color?: string
  link: string
  menu?: RestaurantMenu
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

async function ensureRestaurantVoteColumn() {
  const pool = getPool()
  const [rows] = await pool.query<Array<mysql.RowDataPacket>>(
    "SHOW COLUMNS FROM restaurants LIKE 'votes'",
  )

  if (rows.length === 0) {
    await pool.query('ALTER TABLE restaurants ADD COLUMN votes INT UNSIGNED NOT NULL DEFAULT 0')
  }
}

function parseStoredMenuItems(value: string | null | undefined) {
  if (!value) {
    return []
  }

  try {
    const parsed = JSON.parse(value)
    return Array.isArray(parsed) ? parsed : []
  } catch {
    return []
  }
}

export function mapRestaurant(row: RestaurantRow): Restaurant {
  return {
    id: row.id,
    name: row.name,
    cuisine: typeof row.cuisine === 'string' ? row.cuisine : '',
    description: row.description ?? '',
    rating: Number(row.average_rating),
    orders: row.times_ordered,
    votes: typeof row.votes === 'number' ? row.votes : 0,
    icon: typeof row.icon === 'string' ? row.icon : '',
    color: typeof row.color === 'string' ? row.color : '#9aa5b1',
    link: typeof row.link === 'string' ? row.link : undefined,
    menuItems: parseStoredMenuItems(row.menu_items_json),
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
        r.link,
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
        r.link,
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

function parsePriceCents(price?: string): number | null {
  if (!price) {
    return null
  }

  const normalized = price.replace(/[^\d.]/g, '')
  const value = Number.parseFloat(normalized)

  if (Number.isNaN(value)) {
    return null
  }

  return Math.round(value * 100)
}

async function ensureMenuItemsColumn() {
  const pool = getPool()
  const [rows] = await pool.query<Array<mysql.RowDataPacket>>(
    "SHOW COLUMNS FROM restaurants LIKE 'menu_items_json'",
  )

  if (rows.length === 0) {
    await pool.query('ALTER TABLE restaurants ADD COLUMN menu_items_json JSON NULL')
  }
}

async function ensureRestaurantLinkColumn() {
  const pool = getPool()
  const [rows] = await pool.query<Array<mysql.RowDataPacket>>(
    "SHOW COLUMNS FROM restaurants LIKE 'link'",
  )

  if (rows.length === 0) {
    await pool.query('ALTER TABLE restaurants ADD COLUMN link VARCHAR(500) NULL')
  }
}

export async function createRestaurant(input: RestaurantCreateInput) {
  const pool = getPool()
  const normalizedName = input.name.trim()

  await ensureMenuItemsColumn()
  await ensureRestaurantVoteColumn()
  await ensureRestaurantLinkColumn()

  let menuItemsPayload: MenuItem[] = []

  if (input.link?.trim()) {
    const menu = await getMenuFromHtml(input.link.trim())

    if (menu && menu.length > 0) {
      menuItemsPayload = menu
    }
  }

  const [result] = await pool.execute<mysql.ResultSetHeader>(
    'INSERT INTO restaurants (name, description, link, menu_items_json, active) VALUES (?, ?, ?, ?, TRUE)',
    [normalizedName, input.description ?? null, input.link?.trim() || null, JSON.stringify(menuItemsPayload)],
  )

  const restaurantId = Number(result.insertId)

  const [rows] = await pool.execute<RestaurantRow[]>(
    'SELECT id, name, description, link, menu_items_json, times_ordered, average_rating FROM restaurants WHERE id = ? LIMIT 1',
    [restaurantId],
  )
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
