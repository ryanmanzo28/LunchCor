import type { Restaurant } from '@/types/restaurant'

export function sortByRating(restaurants: Restaurant[]) {
  return [...restaurants].sort((a, b) => b.rating - a.rating)
}

export function sortByPopularity(restaurants: Restaurant[]) {
  return [...restaurants].sort((a, b) => b.orders - a.orders)
}

export function randomRestaurant(restaurants: Restaurant[]) {
  if (!restaurants.length) return null

  return restaurants[Math.floor(Math.random() * restaurants.length)]
}