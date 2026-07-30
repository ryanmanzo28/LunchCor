import * as cheerio from 'cheerio'

export interface MenuItem {
  section?: string
  name: string
  description?: string
  price?: string
}
// ill be honest majoirty of this aprser was ai assited because i honestly dont know where to sart when it comes to html scraping at this level
const PRICE_REGEX = /\$?\d+(?:\.\d{2})?/
const HEADING_TAGS = ['h1', 'h2', 'h3', 'h4', 'h5', 'h6']
const SKIP_TAGS = ['script', 'style', 'noscript']
const CANDIDATE_TAGS = ['li', 'p', 'div', 'tr', 'td', 'article', 'section', 'span', 'a', 'strong']
const NOISE_TOKENS = ['menu', 'hours', 'location', 'contact', 'about', 'order', 'delivery', 'reservation', 'follow', 'social']

function normalizeText(value: string): string {
  return value.replace(/\s+/g, ' ').trim()
}

function parseItemFromText(text: string, section?: string): MenuItem | null {
  const normalizedText = normalizeText(text)

  if (!normalizedText || normalizedText.length < 3 || normalizedText.length > 220) {
    return null
  }

  const priceMatch = normalizedText.match(PRICE_REGEX)

  if (!priceMatch) {
    return null
  }

  const price = priceMatch[0]
  const itemText = normalizedText.replace(price, '').trim()

  if (!itemText || itemText.length < 2) {
    return null
  }

  if (NOISE_TOKENS.some((token) => itemText.toLowerCase().includes(token))) {
    return null
  }

  const lines = itemText
    .split(/\r?\n|•|–|—/)
    .map((line) => line.trim())
    .filter(Boolean)

  const fallbackParts = itemText
    .split(/\s(?:-|–|—)\s/)
    .map((line) => line.trim())
    .filter(Boolean)

  const parts = lines.length > 1 ? lines : fallbackParts.length > 1 ? fallbackParts : [itemText]

  if (parts.length === 0) {
    return null
  }

  const name = parts[0] || 'Untitled item'
  const description = parts.length > 1 ? parts.slice(1).join(' ') : undefined

  if (name.length > 120) {
    return null
  }

  return {
    section,
    name,
    description,
    price,
  }
}

function walkMenuNodes($: any, element: any, currentSection: string | undefined, items: MenuItem[]) {
  const tag = (element.tagName || '').toLowerCase()

  if (!tag || SKIP_TAGS.includes(tag)) {
    return
  }

  if (HEADING_TAGS.includes(tag)) {
    const text = normalizeText($(element).text())

    if (text && text.length < 80) {
      currentSection = text
    }

    return
  }

  const text = normalizeText($(element).text())

  if (text && (CANDIDATE_TAGS.includes(tag) || tag === 'body')) {
    const itemFromText = parseItemFromText(text, currentSection)

    if (itemFromText) {
      items.push(itemFromText)
      return
    }
  }

  $(element)
    .children()
    .each((_: unknown, child: any) => {
      walkMenuNodes($, child, currentSection, items)
    })
}

export async function getMenuFromHtml(website: string): Promise<MenuItem[] | null> {
  const response = await fetch(website, {
    headers: {
      'User-Agent': 'Mozilla/5.0 (compatible; LunchcorBot/1.0)',
      Accept: 'text/html,application/xhtml+xml',
    },
  })

  if (!response.ok) {
    return null
  }

  const html = await response.text()
  const $ = cheerio.load(html)
  const menu = parseMenuHtml($.root().html() || '')

  return menu.length > 0 ? menu : null
}

export function parseMenuHtml(html: string): MenuItem[] {
  const $ = cheerio.load(html)
  const items: MenuItem[] = []

  $('body').children().each((_: unknown, child: any) => {
    walkMenuNodes($, child, undefined, items)
  })

  return items.filter((item, index, array) => {
    const key = `${item.section || ''}::${item.name}::${item.price || ''}`
    return array.findIndex((entry) => `${entry.section || ''}::${entry.name}::${entry.price || ''}` === key) === index
  })
}

