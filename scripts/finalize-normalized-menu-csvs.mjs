import fs from 'node:fs'
import path from 'node:path'

const dataDir = path.resolve('data')
const fields = ['restaurant', 'category', 'name', 'description', 'price_cents', 'currency', 'image_url', 'item_url']

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

function titleCaseCategory(category) {
  return category
    .replace(/[-_]+/g, ' ')
    .replace(/\s+/g, ' ')
    .trim()
    .replace(/\b\w/g, char => char.toUpperCase())
    .replace(/'S\b/g, "'s")
}

function normalizedKey(value) {
  return value
    .normalize('NFKD')
    .replace(/[\u0300-\u036f]/g, '')
    .toLocaleLowerCase()
    .replace(/[^\p{L}\p{N}]+/gu, ' ')
    .trim()
}

function isCateringItem(item) {
  return /\bcatering\b/i.test([item.category, item.name, item.description, item.item_url].join(' '))
}

function isScraperArtifact(item) {
  return /^https?:\/\//i.test(item.name) || /^(item href|headertext|itemdescription|price)$/i.test(item.name)
}

function escapeCsv(value) {
  const text = String(value ?? '')
  return /[",\r\n]/.test(text) ? `"${text.replaceAll('"', '""')}"` : text
}

for (const filename of fs.readdirSync(dataDir).filter(name => name.endsWith('.csv'))) {
  const [header, ...rows] = parseCsv(fs.readFileSync(path.join(dataDir, filename), 'utf8'))
  if (!header) {
    console.warn(`${filename}: skipped empty file`)
    continue
  }
  if (header.join(',') !== fields.join(',')) throw new Error(`${filename} is not in the canonical schema`)
  const deduped = new Map()
  for (const values of rows) {
    const item = Object.fromEntries(fields.map((field, index) => [field, values[index] ?? '']))
    item.category = titleCaseCategory(item.category)
    item.name = item.name.replace(/^new item\s*!?\s*/i, '').trim()
    // A few wide Grandfanally's cells put the price before the item name. Repair those records.
    if (item.restaurant === "Granfanally's" && /^\$\d/.test(item.name) && item.description) {
      item.price_cents = String(Math.round(Number(item.name.replace(/[^\d.]/g, '')) * 100))
      item.name = item.description
      item.description = ''
    }
    if (isCateringItem(item) || isScraperArtifact(item)) continue
    const key = [item.restaurant, item.category, item.name].map(normalizedKey).join('\u0000')
    const prior = deduped.get(key)
    if (!prior || Object.values(item).filter(Boolean).length > Object.values(prior).filter(Boolean).length) deduped.set(key, item)
  }
  const output = [...deduped.values()].sort((a, b) => [a.restaurant, a.category, a.name].join('\u0000').localeCompare([b.restaurant, b.category, b.name].join('\u0000')))
  fs.writeFileSync(path.join(dataDir, filename), `${fields.join(',')}\n${output.map(item => fields.map(field => escapeCsv(item[field])).join(',')).join('\n')}\n`)
  console.log(`${filename}: ${output.length} unique normalized menu items`)
}
