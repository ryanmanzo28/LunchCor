export interface Restaurant {
  id: number
  name: string
  cuisine: string
  description: string
  rating: number
  orders: number
  votes: number
  icon: string
  color: string
  link?: string
  // Menu items are optional because scraping/import may not have run yet.
  menuItems?: Array<{
    section?: string
    name: string
    description?: string
    price?: string
  }>
}