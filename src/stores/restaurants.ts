import { defineStore } from 'pinia'
import type { Restaurant } from '@/types/restaurant'
import { normalizeCount, randomRestaurant, restaurantIdByName, sortByPopularity, sortByRating } from '@/utils/restaurants'

interface RestaurantsResponse {
  status: string
  count: number
  restaurants: Restaurant[]
}

interface VoteResponse {
  success: boolean
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
    // Avoid overlapping requests and unnecessary re-fetches.
    if (isLoading.value || (hasLoaded.value && !force)) {
      return
    }

    isLoading.value = true
    loadError.value = null

    try {
      const response = await useAPIData<RestaurantsResponse>('/restaurants')
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

  async function refreshMenusLightweight() {
    // Menu refresh is intentionally disabled.
    return
  }

  function idFromName(name: string) {
    return restaurantIdByName(restaurants.value, name)
  }

  function getRestaurantWithMostVotes() {
    return [...restaurants.value]
      .sort((left, right) => {
        const byVotes = normalizeCount(right.timesVoted) - normalizeCount(left.timesVoted)
        if (byVotes !== 0) {
          return byVotes
        }

        return left.name.localeCompare(right.name)
      })[0] ?? null
  }

  function getRestaurantMenuItems(restaurantId: number) {
    const restaurant = restaurants.value.find((item) => item.id === restaurantId)

    if (!restaurant) {
      return []
    }

    return restaurant.menuItems ?? []
  }

  function applyVoteLocally(id: number) {
    const choice = restaurants.value.find((restaurant) => restaurant.id === id)

    if (!choice) {
      return
    }

    choice.votes = normalizeCount(choice.votes) + 1
    choice.timesVoted = normalizeCount(choice.timesVoted) + 1
    selectedId.value = id
  }

  async function voteFor(id: number) {
    // Backend enforces one vote per user, so skip duplicate local attempts.
    if (selectedId.value) {
      return
    }

    const authStore = useAuthStore()
    const currentUserId = authStore.userId

    if (!currentUserId) {
      loadError.value = 'You must be signed in to vote.'
      return
    }

    loadError.value = null

    try {
      const response = await useAPIData<VoteResponse>('/votes/vote', {
        method: 'POST',
        body: {
          restaurantId: id,
        },
      })

      if (response.success) {
        applyVoteLocally(id)
      }
    }
    catch (error: any) {
      if (error?.statusCode === 409) {
        loadError.value = 'You have already cast your vote for today.'
        return
      }

      loadError.value = 'Unable to submit your vote right now.'
    }
  }

  async function pickSurprise() {
    if (!restaurants.value.length) {
      return
    }

    const choice = randomRestaurant(restaurants.value.filter((restaurant) => restaurant.id !== selectedId.value))
    const fallback = restaurants.value[0]
    if (!fallback) {
      return
    }

    await voteFor(choice?.id ?? fallback.id)
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
    idFromName,
    getRestaurantWithMostVotes,
    getRestaurantMenuItems,
    fetchRestaurants,
    refreshMenusLightweight,
    voteFor,
    pickSurprise,
  }
})