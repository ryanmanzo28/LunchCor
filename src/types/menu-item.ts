export interface MenuItem {
  id: number
  restaurantId: number
  name: string
  description: string | null
  category: string | null
  priceCents: number | null
  currency: string
  isAvailable: boolean
  availableFrom: string | null
  availableTo: string | null
}
