import fs from 'node:fs'

const input = 'data/blue-mango.csv'
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

function clean(value = '') {
  return value.replace(/\u00a0/g, ' ').replace(/SautÃ©ed/g, 'Sautéed').replace(/sautÃ©ed/g, 'sautéed').replace(/\s+/g, ' ').trim()
}

function cents(value) {
  const match = value.match(/\d+(?:\.\d{1,2})?/)
  return match ? String(Math.round(Number(match[0]) * 100)) : ''
}

function escapeCsv(value) {
  const text = String(value ?? '')
  return /[",\r\n]/.test(text) ? `"${text.replaceAll('"', '""')}"` : text
}

const [header, ...rows] = parseTsv(fs.readFileSync(input, 'utf8'))
const nameColumns = header.map((value, index) => /^foodName(?: \d+)?$/i.test(value) ? index : -1).filter(index => index >= 0)
const descriptionColumns = new Set(header.map((value, index) => /^font-color(?: \d+)?$/i.test(value) ? index : -1).filter(index => index >= 0))
const imageColumns = new Set(header.map((value, index) => /^rounded src(?: \d+)?$/i.test(value) ? index : -1).filter(index => index >= 0))
const output = []

for (const row of rows) {
  const category = clean(row[0])
  const itemUrl = clean(row[1])
  const prices = row.map((value, index) => /^\$\d/.test(clean(value)) ? index : -1).filter(index => index >= 0)
  const usedPrices = new Set()
  for (const nameIndex of nameColumns) {
    const name = clean(row[nameIndex])
    if (!name || /^new item!?$/i.test(name)) continue
    const priceIndex = prices
      .filter(index => !usedPrices.has(index))
      .sort((left, right) => Math.abs(left - nameIndex) - Math.abs(right - nameIndex))[0]
    if (priceIndex === undefined || Math.abs(priceIndex - nameIndex) > 3) continue
    usedPrices.add(priceIndex)
    const descriptionIndex = [...descriptionColumns]
      .filter(index => Math.abs(index - nameIndex) <= 2 && clean(row[index]) && clean(row[index]) !== '...')
      .sort((left, right) => Math.abs(left - nameIndex) - Math.abs(right - nameIndex))[0]
    const imageIndex = [...imageColumns].filter(index => index < nameIndex && clean(row[index]).startsWith('http')).sort((a, b) => b - a)[0]
    output.push({ restaurant: 'Blue Mango', category, name, description: clean(row[descriptionIndex]), price_cents: cents(clean(row[priceIndex])), currency: 'USD', image_url: clean(row[imageIndex]), item_url: itemUrl })
  }
}

const deduped = new Map()
for (const item of output) {
  const key = [item.restaurant, item.category, item.name].map(value => value.toLowerCase()).join('\u0000')
  if (!deduped.has(key)) deduped.set(key, item)
}
const normalized = [...deduped.values()].sort((a, b) => [a.category, a.name].join('\u0000').localeCompare([b.category, b.name].join('\u0000')))
fs.writeFileSync(input, `${fields.join(',')}\n${normalized.map(item => fields.map(field => escapeCsv(item[field])).join(',')).join('\n')}\n`)
console.log(`blue-mango.csv: ${normalized.length} normalized menu items`)
