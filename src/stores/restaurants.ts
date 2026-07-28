import { defineStore } from 'pinia'
import type { Restaurant } from '@/types/restaurant'
import { randomRestaurant, sortByPopularity, sortByRating } from '@/utils/restaurants'

interface RestaurantsResponse {
  status: string
  count: number
  restaurants: Restaurant[]
}

export const useRestaurantsStore = defineStore('restaurants', () => {
  const selectedId = useState<number | null>('selected-restaurant', () => null)
  const restaurants = useState<Restaurant[]>('restaurants', () => [])
  const isLoading = useState<boolean>('restaurants-loading', () => false)
  const hasLoaded = useState<boolean>('restaurants-loaded', () => false)
  const loadError = useState<string | null>('restaurants-error', () => null)

  const rankedRestaurants = computed(() => sortByRating(restaurants.value))
  const popularRestaurants = computed(() => sortByPopularity(restaurants.value).slice(0, 3))
  const leader = computed<Restaurant | null>(() => rankedRestaurants.value[0] ?? restaurants.value[0] ?? null)
  const totalVotes = computed(() => restaurants.value.reduce((total, restaurant) => total + restaurant.votes, 0))
  const leaderPercent = computed(() => {
    if (!leader.value || totalVotes.value === 0) {
      return 0
    }

    return Math.round((leader.value.votes / totalVotes.value) * 100)
  })
  const selectedRestaurant = computed(() => restaurants.value.find((restaurant) => restaurant.id === selectedId.value) ?? null)

  async function fetchRestaurants(force = false) {
    if (isLoading.value || (hasLoaded.value && !force)) {
      return
    }

    isLoading.value = true
    loadError.value = null

    try {
      const response = await $fetch<RestaurantsResponse>('/api/restaurants')
      restaurants.value = response.restaurants
      hasLoaded.value = true

      if (selectedId.value && !restaurants.value.some((restaurant) => restaurant.id === selectedId.value)) {
        selectedId.value = null
      }
    }
    catch {
      loadError.value = 'Unable to load restaurants right now.'
    }
    finally {
      isLoading.value = false
    }
  }

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
    if (!restaurants.value.length) {
      return
    }

    const choice = randomRestaurant(restaurants.value.filter((restaurant) => restaurant.id !== selectedId.value))
    voteFor(choice?.id ?? restaurants.value[0].id)
  }

  if (import.meta.client) {
    void fetchRestaurants()
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
    isLoading,
    hasLoaded,
    loadError,
    fetchRestaurants,
    voteFor,
    pickSurprise,
  }
})