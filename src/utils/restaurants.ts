import type { Restaurant } from '@/types/restaurant'

export function sortByRating(restaurants: Restaurant[]) {
  // Return a copy so callers keep original order untouched.
  return [...restaurants].sort((a, b) => b.rating - a.rating)
}

export function sortByPopularity(restaurants: Restaurant[]) {
  return [...restaurants].sort((a, b) => b.orders - a.orders)
}

export function sortByTimesVoted(restaurants: Restaurant[]) {
  return [...restaurants].sort((a, b) => b.timesVoted - a.timesVoted)
}

export function randomRestaurant(restaurants: Restaurant[]) {
  if (!restaurants.length) return null

  // Uniform random selection across available restaurants.
  return restaurants[Math.floor(Math.random() * restaurants.length)]
}

export function restaurantIdByName(restaurants: Restaurant[], name: string) {
  const normalizedName = name.trim().toLowerCase()

  if (!normalizedName) {
    return null
  }

  const match = restaurants.find((restaurant) => restaurant.name.trim().toLowerCase() === normalizedName)
  return match?.id ?? null
}