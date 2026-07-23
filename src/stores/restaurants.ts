import { defineStore } from 'pinia'
import type { Restaurant } from '@/types/restaurant'
import { randomRestaurant, sortByPopularity, sortByRating } from '@/utils/restaurants'

const initialRestaurants: Restaurant[] = [
  { id: 1, name: 'Maddie’s', cuisine: 'American', description: 'Sandwiches, salads, and all-day comfort food.', rating: 4.7, orders: 42, votes: 8, icon: 'M', color: '#f6c177' },
  { id: 2, name: 'Windham Junction', cuisine: 'Cafe', description: 'Fresh bowls, wraps, and a great daily special.', rating: 4.5, orders: 35, votes: 6, icon: 'W', color: '#9ccfd8' },
  { id: 3, name: 'Pressed', cuisine: 'Mediterranean', description: 'Bright, quick Mediterranean plates and pita.', rating: 4.8, orders: 29, votes: 4, icon: 'P', color: '#c4a7e7' },
  { id: 4, name: 'Saigon Kitchen', cuisine: 'Vietnamese', description: 'Banh mi, pho, and rice bowls made to order.', rating: 4.6, orders: 18, votes: 3, icon: 'S', color: '#a3be8c' },
]

export const useRestaurantsStore = defineStore('restaurants', () => {
  const selectedId = useState<number | null>('selected-restaurant', () => null)
  const restaurants = useState<Restaurant[]>('restaurants', () => initialRestaurants)

  const rankedRestaurants = computed(() => sortByRating(restaurants.value))
  const popularRestaurants = computed(() => sortByPopularity(restaurants.value).slice(0, 3))
  const leader = computed(() => rankedRestaurants.value[0] ?? restaurants.value[0])
  const totalVotes = computed(() => restaurants.value.reduce((total, restaurant) => total + restaurant.votes, 0))
  const leaderPercent = computed(() => {
    if (!leader.value || totalVotes.value === 0) {
      return 0
    }

    return Math.round((leader.value.votes / totalVotes.value) * 100)
  })
  const selectedRestaurant = computed(() => restaurants.value.find((restaurant) => restaurant.id === selectedId.value) ?? null)

  function voteFor(id: number) {
    if (selectedId.value === id) {
      return
    }

    if (selectedId.value) {
      const previous = restaurants.value.find((restaurant) => restaurant.id === selectedId.value)

      if (previous) {
        previous.votes -= 1
      }
    }

    const choice = restaurants.value.find((restaurant) => restaurant.id === id)

    if (choice) {
      choice.votes += 1
      selectedId.value = id
    }
  }

  function pickSurprise() {
    const choice = randomRestaurant(restaurants.value.filter((restaurant) => restaurant.id !== selectedId.value))
    voteFor(choice?.id ?? restaurants.value[0].id)
  }

  return {
    selectedId,
    restaurants,
    rankedRestaurants,
    popularRestaurants,
    leader,
    totalVotes,
    leaderPercent,
    selectedRestaurant,
    voteFor,
    pickSurprise,
  }
})