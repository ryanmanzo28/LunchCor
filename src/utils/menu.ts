
export interface MenuItem {
    name: string
    description?: string
    price: string
    section?: string
    icon?: {
        url: string
    }
}

export interface Menu {
  restaurant: string
  items: MenuItem[]
}

function getUserAgentHeaders(): Record<string, string> {
    return {
        'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36',
    }
}
// this was really not fun to build 
export async function parseGenericMenu(response: string): Promise<Menu> {
    const html = response
    const restaurant = (html.match(/<title[^>]*>([\s\S]*?)<\/title>/i)?.[1] || '').replace(/\s+/g, ' ').trim()
    const decodeHtml = (value: string) =>
        value
            .replace(/&amp;/g, '&')
            .replace(/&apos;|&#39;/g, "'")
            .replace(/&quot;/g, '"')
            .replace(/&nbsp;/g, ' ')

    const jsonFallback = Array.from(html.matchAll(/"name"\s*:\s*"([^\"]{2,160})"[\s\S]{0,260}?"price"\s*:\s*"?([0-9]+(?:\.[0-9]{1,2})?)"?/gi))
        .map((m: RegExpMatchArray) => ({ name: decodeHtml((m[1] || '').trim()), price: String(m[2]) }))
        .filter((x) => x.name && Number.isFinite(Number(x.price)) && !/\(\d{3}\)|our menu|support|salem|nh|open/i.test(x.name)) as MenuItem[]
    const siteFallback = jsonFallback.length ? [] : (/vallarta/i.test(restaurant)
        ? Array.from(html.matchAll(/woocommerce-loop-product__title[^>]*>([^<]{2,120})<[\s\S]{0,260}?\$\s*([0-9]+(?:\.[0-9]{1,2})?)/gi)).map((m: RegExpMatchArray) => ({ name: (m[1] || '').trim(), price: String(m[2]) }))
        : /maddies/i.test(restaurant) || /food-item-title/i.test(html)
            ? Array.from(html.matchAll(/food-item-title[^>]*>\s*<h3>([^<]{2,120})<\/h3>[\s\S]{0,220}?food-price[^>]*>\s*\$?\s*([0-9]+(?:\.[0-9]{1,2})?)/gi)).map((m: RegExpMatchArray) => ({ name: decodeHtml((m[1] || '').trim()), price: String(m[2]) }))
        : /pressed\s*cafe/i.test(restaurant)
            ? Array.from(html.matchAll(/"title"\s*:\s*"([^\"]{2,120})"[\s\S]{0,200}?"price"\s*:\s*"?([0-9]+(?:\.[0-9]{1,2})?)"?/gi)).map((m: RegExpMatchArray) => ({ name: (m[1] || '').trim(), price: String(m[2]) }))
            : []) as MenuItem[]
    const textFallback = jsonFallback.length ? [] : Array.from((html.replace(/<[^>]+>/g, ' ').matchAll(/([A-Za-z][A-Za-z0-9 '&(),.+\/-]{2,80})\s+\$\s*([0-9]+(?:\.[0-9]{1,2})?)/g)))
        .map((m: RegExpMatchArray) => ({ name: (m[1] || '').trim(), price: String(m[2]) })) as MenuItem[]
    const normalizedItems = (jsonFallback.length ? jsonFallback : (siteFallback.length ? siteFallback : textFallback))
        .filter((v, i, a) => a.findIndex((x) => x.name === v.name && x.price === v.price) === i)

    return {
        restaurant: restaurant || 'Menu',
        items: normalizedItems
    }
}

function isChallengeHtml(html: string): boolean {
    return /just a moment|cf-challenge|captcha|cloudflare/i.test(html)
}

async function fetchRenderedHtml(url: string): Promise<string | null> {
    let browser: any = null
    try {
        const playwright = await (0, eval)('import("playwright")')
        browser = await playwright.chromium.launch({ headless: true })
        const page = await browser.newPage({ userAgent: getUserAgentHeaders()['User-Agent'] })
        await page.route('**/*', (route: any) => {
            const type = route.request().resourceType()
            if (type === 'image' || type === 'font' || type === 'media') {
                return route.abort()
            }
            return route.continue()
        })
        await page.goto(url, { waitUntil: 'domcontentloaded', timeout: 12000 })
        return await page.content()
    } catch {
        return null
    } finally {
        await browser?.close()
    }
}

export async function getMenuFromHtml(url: string): Promise<MenuItem[] | null> {
    const html = await fetch(url, { headers: getUserAgentHeaders() }).then((r) => r.text())
    const parsed = await parseGenericMenu(html)
    if (parsed.items.length > 0 && !isChallengeHtml(html)) {
        return parsed.items
    }

    const rendered = await fetchRenderedHtml(url)
    if (!rendered) {
        return parsed.items.length ? parsed.items : null
    }

    const renderedParsed = await parseGenericMenu(rendered)
    return renderedParsed.items.length ? renderedParsed.items : null
}