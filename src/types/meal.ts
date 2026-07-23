export interface Meal {
  id: number
  restaurantId: number
  name: string
  description: string | null
  averageRating: number
  active: boolean
}