import mysql from 'mysql2/promise'
import { getPool } from '~/server/utils/db'

interface RestaurantRow extends mysql.RowDataPacket {
  id: number
  name: string
  menu_items_json: string | null
}

interface MenuItemRow extends mysql.RowDataPacket {
  name: string
  description: string | null
  category: string | null
  price_cents: number | null
  currency: string | null
}

interface LegacyMenuItem {
  section?: string
  name?: string
  description?: string
  price?: string
}

function formatPrice(priceCents: number | null, currency: string | null) {
  if (priceCents == null) {
    return undefined
  }

  const code = (currency || 'USD').toUpperCase()

  try {
    return new Intl.NumberFormat('en-US', {
      style: 'currency',
      currency: code,
      maximumFractionDigits: 2,
    }).format(priceCents / 100)
  } catch {
    return `$${(priceCents / 100).toFixed(2)}`
  }
}

function parseLegacyMenuItems(value: string | null | undefined) {
  if (!value) {
    return [] as Array<{ section?: string, name: string, description?: string, price?: string }>
  }

  try {
    const parsed = JSON.parse(value) as unknown
    if (!Array.isArray(parsed)) {
      return []
    }

    const normalized: Array<{ section?: string, name: string, description?: string, price?: string }> = []

    for (const item of parsed) {
      const candidate = item as LegacyMenuItem
      const name = typeof candidate?.name === 'string' ? candidate.name.trim() : ''

      if (!name) {
        continue
      }

      normalized.push({
        section: typeof candidate.section === 'string' && candidate.section.trim() ? candidate.section.trim() : undefined,
        name,
        description: typeof candidate.description === 'string' && candidate.description.trim() ? candidate.description.trim() : undefined,
        price: typeof candidate.price === 'string' && candidate.price.trim() ? candidate.price.trim() : undefined,
      })
    }

    return normalized
  }
  catch {
    return []
  }
}

export default defineEventHandler(async (event) => {
  const id = Number(getRouterParam(event, 'id'))

  if (!Number.isInteger(id) || id <= 0) {
    throw createError({
      statusCode: 400,
      statusMessage: 'Invalid restaurant ID',
    })
  }

  const pool = getPool()
  const [restaurantRows] = await pool.query<RestaurantRow[]>(
    'SELECT id, name, menu_items_json FROM restaurants WHERE id = ? AND active = TRUE LIMIT 1',
    [id],
  )

  const restaurant = restaurantRows[0]

  if (!restaurant) {
    throw createError({
      statusCode: 404,
      statusMessage: 'Restaurant not found',
    })
  }

  const [menuRows] = await pool.query<MenuItemRow[]>(
    `SELECT name, description, category, price_cents, currency
     FROM menu_items
     WHERE restaurant_id = ?
       AND is_available = TRUE
     ORDER BY COALESCE(category, ''), name ASC`,
    [id],
  )

  const normalizedRows = menuRows.map((row) => ({
    section: row.category || undefined,
    name: row.name,
    description: row.description || undefined,
    price: formatPrice(row.price_cents, row.currency),
  }))

  // Prefer normalized migration-backed table rows, then fall back to legacy JSON payloads.
  const menuItems = normalizedRows.length > 0
    ? normalizedRows
    : parseLegacyMenuItems(restaurant.menu_items_json)

  return {
    restaurantId: restaurant.id,
    restaurantName: restaurant.name,
    menuItems,
  }
})