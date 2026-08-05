import fs from 'node:fs'

const input = 'data/grand-india.csv'
const fields = ['restaurant', 'category', 'name', 'description', 'price_cents', 'currency', 'image_url', 'item_url']

function parseTsv(text) {
  const rows = []; let row = [], value = '', quoted = false
  for (let index = 0; index < text.length; index += 1) {
    const char = text[index]
    if (char === '"') { if (quoted && text[index + 1] === '"') { value += char; index += 1 } else quoted = !quoted }
    else if (char === '\t' && !quoted) { row.push(value); value = '' }
    else if ((char === '\n' || char === '\r') && !quoted) { if (char === '\r' && text[index + 1] === '\n') index += 1; row.push(value); rows.push(row); row = []; value = '' }
    else value += char
  }
  if (value || row.length) { row.push(value); rows.push(row) }
  return rows.filter(row => row.some(value => value.trim()))
}

function clean(value = '') { return value.replace(/\u00a0/g, ' ').replace(/\s+/g, ' ').trim() }
function titleCase(value) { return clean(value).toLocaleLowerCase().replace(/\b[\p{L}]/gu, char => char.toLocaleUpperCase()) }
function cents(value) { const match = value.match(/\d+(?:\.\d{1,2})?/); return match ? String(Math.round(Number(match[0]) * 100)) : '' }
function escapeCsv(value) { const text = String(value ?? ''); return /[",\r\n]/.test(text) ? `"${text.replaceAll('"', '""')}"` : text }

const [, ...rows] = parseTsv(fs.readFileSync(input, 'utf8'))
const items = []
for (const row of rows) {
  const category = titleCase(row[0])
  if (!category) continue
  for (let index = 1; index < row.length; index += 1) {
    const price = clean(row[index])
    if (!/^\$\d/.test(price)) continue
    const name = titleCase(row[index - 1])
    if (!name || /^https?:\/\//i.test(name)) continue
    const imageIndex = row.slice(0, index).map(clean).map((value, position) => /^https?:\/\//i.test(value) ? position : -1).filter(position => position >= 0).at(-1)
    items.push({ restaurant: 'Grand India', category, name, description: '', price_cents: cents(price), currency: 'USD', image_url: imageIndex === undefined ? '' : clean(row[imageIndex]), item_url: '' })
  }
}

const deduped = new Map()
for (const item of items) {
  const key = [item.restaurant, item.category, item.name].map(value => value.toLocaleLowerCase()).join('\u0000')
  if (!deduped.has(key)) deduped.set(key, item)
}
const output = [...deduped.values()].sort((a, b) => [a.category, a.name].join('\u0000').localeCompare([b.category, b.name].join('\u0000')))
fs.writeFileSync(input, `${fields.join(',')}\n${output.map(item => fields.map(field => escapeCsv(item[field])).join(',')).join('\n')}\n`)
console.log(`grand-india.csv: ${output.length} normalized menu items`)
