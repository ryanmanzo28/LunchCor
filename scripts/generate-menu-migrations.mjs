import fs from 'node:fs'
import path from 'node:path'

const fields = ['restaurant', 'category', 'name', 'description', 'price_cents', 'currency', 'image_url', 'item_url']
const migrationsDir = path.resolve('database/init')
const migrationOrder = [
  ['blue-mango.csv', '017_blue_mango_menu_items.sql', 'Thai', 'Thai favorites and modern Asian comfort food.', 'BM', '#38b2ac'],
  ['grand-india.csv', '018_grand_india_menu_items.sql', 'Indian', 'Classic Indian dishes, curries, biryani, and tandoori favorites.', 'GI', '#ed8936'],
  ['grandfanallys.csv', '019_granfanallys_menu_items.sql', 'Italian', 'New York-style pizza, Italian classics, and subs.', 'GF', '#e53e3e'],
  ['maddiesnh.csv', '020_maddies_bagel_and_eatery_menu_items.sql', 'American', 'Bagels, breakfast, sandwiches, and comfort food.', 'MB', '#f6c177'],
  ['pressed.csv', '021_pressed_cafe_menu_items.sql', 'Cafe', 'Fresh salads, bowls, sandwiches, and smoothies.', 'PC', '#6b8e23'],
  ['vallarta.csv', '022_vallarta_mexican_grill_menu_items.sql', 'Mexican', 'Authentic Mexican tacos, burritos, sides, and salsas.', 'VM', '#dd6b20'],
  ['windhamjunction.csv', '023_windham_junction_menu_items.sql', 'Deli', 'Fresh deli sandwiches and classic lunch favorites.', 'WJ', '#4299e1']
]

function parseCsv(text) {
  const rows = []; let row = [], value = '', quoted = false
  for (let index = 0; index < text.length; index += 1) {
    const char = text[index]
    if (char === '"') { if (quoted && text[index + 1] === '"') { value += char; index += 1 } else quoted = !quoted }
    else if (char === ',' && !quoted) { row.push(value); value = '' }
    else if ((char === '\n' || char === '\r') && !quoted) { if (char === '\r' && text[index + 1] === '\n') index += 1; row.push(value); rows.push(row); row = []; value = '' }
    else value += char
  }
  if (value || row.length) { row.push(value); rows.push(row) }
  return rows.filter(row => row.some(Boolean))
}

function sql(value) {
  if (value === null || value === undefined || value === '') return 'NULL'
  return `'${String(value).replaceAll('\\', '\\\\').replaceAll("'", "''")}'`
}

const iconColumnMigration = `-- Preserve source-provided menu item images as icons.\nSET @add_menu_item_icon_url = (\n  SELECT IF(\n    COUNT(*) = 0,\n    'ALTER TABLE menu_items ADD COLUMN icon_url VARCHAR(2048) NULL AFTER currency',\n    'SELECT 1'\n  )\n  FROM information_schema.columns\n  WHERE table_schema = DATABASE()\n    AND table_name = 'menu_items'\n    AND column_name = 'icon_url'\n);\nPREPARE stmt FROM @add_menu_item_icon_url;\nEXECUTE stmt;\nDEALLOCATE PREPARE stmt;\n`
fs.writeFileSync(path.join(migrationsDir, '016_menu_item_icon_url.sql'), iconColumnMigration)

for (const [csvName, migrationName, cuisine, description, icon, color] of migrationOrder) {
  const [header, ...rows] = parseCsv(fs.readFileSync(path.resolve('data', csvName), 'utf8'))
  if (header.join(',') !== fields.join(',')) throw new Error(`${csvName} is not normalized`)
  const items = rows.map(row => Object.fromEntries(fields.map((field, index) => [field, row[index] ?? ''])))
  const restaurant = items[0]?.restaurant
  if (!restaurant || items.some(item => item.restaurant !== restaurant)) throw new Error(`${csvName} has inconsistent restaurant names`)

  const statements = items.map(item => `INSERT INTO menu_items (restaurant_id, name, description, category, price_cents, currency, icon_url, is_available)\nSELECT @restaurant_id, ${sql(item.name)}, ${sql(item.description)}, ${sql(item.category)}, ${sql(item.price_cents)}, ${sql(item.currency || 'USD')}, ${sql(item.image_url)}, TRUE\nWHERE @restaurant_id IS NOT NULL\n  AND NOT EXISTS (\n    SELECT 1 FROM menu_items mi\n    WHERE mi.restaurant_id = @restaurant_id\n      AND LOWER(mi.name) = LOWER(${sql(item.name)})\n      AND COALESCE(mi.category, '') = COALESCE(${sql(item.category)}, '')\n  );`).join('\n\n')

  const content = `-- Generated from data/${csvName}; safe to re-run.\nINSERT INTO restaurants (name, cuisine, description, icon, color, active)\nSELECT ${sql(restaurant)}, ${sql(cuisine)}, ${sql(description)}, ${sql(icon)}, ${sql(color)}, TRUE\nWHERE NOT EXISTS (SELECT 1 FROM restaurants WHERE name = ${sql(restaurant)});\n\nSET @restaurant_id := (SELECT id FROM restaurants WHERE name = ${sql(restaurant)} LIMIT 1);\n\n${statements}\n`
  fs.writeFileSync(path.join(migrationsDir, migrationName), content)
  console.log(`${migrationName}: ${items.length} menu items`)
}
