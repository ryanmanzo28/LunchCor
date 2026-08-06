<template>
  <main class="dashboard">
    <header class="topbar">
      <NuxtLink class="brand" to="/">Lunch<span>Cor</span></NuxtLink>
      <div class="profile">
        <span class="avatar">{{ initials }}</span>
        <span>{{ userStore.user?.name ?? 'User' }}</span>
      </div>
    </header>
    <section class="panel" aria-labelledby="restaurants-heading">
      <p class="eyebrow">Directory</p>
      <h1 id="restaurants-heading">All Restaurants</h1>

      <p v-if="isLoading" class="muted">Loading restaurants...</p>
      <p v-else-if="loadError" class="muted">{{ loadError }}</p>

      <ul v-else class="restaurant-grid" aria-label="All restaurants">
        <li v-for="restaurant in allRestaurants" :key="restaurant.id" class="restaurant-item">
          <button type="button" class="card-trigger" @click="openMenuModal(restaurant)">
            <LazyRestaurantCard
              :name="restaurant.name"
              :description="restaurant.description"
              :rating="restaurant.rating"
              :icon="restaurant.icon"
              :color="restaurant.color"
            />
          </button>
        </li>
      </ul>

      <div v-if="isMenuModalOpen" class="menu-modal-backdrop" role="presentation" @click="closeMenuModal">
        <section
          class="menu-modal"
          role="dialog"
          aria-modal="true"
          :aria-label="selectedRestaurant?.name ? `${selectedRestaurant.name} menu` : 'Restaurant menu'"
          @click.stop
        >
          <header class="menu-modal-header">
            <h2>{{ selectedRestaurant?.name ?? 'Menu' }}</h2>
            <button type="button" class="menu-close secondary-button" @click="closeMenuModal" aria-label="Close menu">x</button>
          </header>

          <LazyMenuItemsList
            :items="selectedMenuItems"
            :loading="isMenuLoading"
            :error="menuLoadError"
          />
        </section>
      </div>
    </section>
  </main>
</template>

<script setup lang="ts">
import type { Restaurant } from '@/types/restaurant'
import { useLazyAPIData } from '@/composables/useAPI'

useHead({
  title: 'List of Restaurants',
  link: [
    { rel: 'icon', href: '/favicon.ico' },
  ],
})

const userStore = useUserStore()
const restaurantsStore = useRestaurantsStore()
const { restaurants: allRestaurants, isLoading, loadError } = storeToRefs(restaurantsStore)

interface RestaurantMenuItem {
  section?: string
  name: string
  description?: string
  price?: string
}

const isMenuModalOpen = ref(false)
const isMenuLoading = ref(false)
const menuLoadError = ref('')
const selectedRestaurant = ref<Restaurant | null>(null)
const selectedMenuItems = ref<RestaurantMenuItem[]>([])

// Match avatar style from the main dashboard.
const initials = computed(() => (userStore.user?.name ?? 'LC').split(' ').map((name) => name[0]).join('').slice(0, 2))
if (import.meta.client) {
  void restaurantsStore.fetchRestaurants()
}

async function openMenuModal(restaurant: Restaurant) {
  selectedRestaurant.value = restaurant
  selectedMenuItems.value = []
  menuLoadError.value = ''
  isMenuLoading.value = true
  isMenuModalOpen.value = true

  try {
    const { data } = await useLazyAPIData<{ menuItems: RestaurantMenuItem[] }>(`/restaurants/${restaurant.id}/menu`)
    const response = data.value
    if (!response) {
      throw createError({
        statusCode: 500,
        statusMessage: 'Empty menu response',
      })
    }

    selectedMenuItems.value = response.menuItems
  }
  catch {
    menuLoadError.value = 'Unable to load menu items right now.'
  }
  finally {
    isMenuLoading.value = false
  }
}

function closeMenuModal() {
  isMenuModalOpen.value = false
}

</script>

<style scoped>
.card-trigger {
  width: 100%;
  padding: 0;
  border: 0;
  background: transparent;
  text-align: left;
  cursor: pointer;
}

.card-trigger:focus-visible {
  outline: 2px solid #3b82f6;
  outline-offset: 4px;
  border-radius: 18px;
}

.restaurant-grid {
  display: grid;
  gap: 14px;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  list-style: none;
  padding: 0;
  margin: 18px 0 0;
  max-height: min(70vh, 760px);
  overflow-y: auto;
  padding-right: 6px;
  content-visibility: auto;
}

.restaurant-item {
  content-visibility: auto;
  min-width: 0;
}

.restaurant-grid::-webkit-scrollbar {
  width: 10px;
}

.restaurant-grid::-webkit-scrollbar-track {
  background: rgba(148, 163, 184, 0.14);
  border-radius: 999px;
}

.restaurant-grid::-webkit-scrollbar-thumb {
  background: rgba(94, 114, 228, 0.35);
  border-radius: 999px;
}

.restaurant-grid::-webkit-scrollbar-thumb:hover {
  background: rgba(94, 114, 228, 0.52);
}

@media (max-width: 640px) {
  .restaurant-grid {
    max-height: none;
  }
}

.menu-modal-backdrop {
  position: fixed;
  inset: 0;
  z-index: 60;
  display: grid;
  place-items: center;
  padding: 16px;
  background: rgba(2, 6, 23, 0.55);
}

.menu-modal {
  content-visibility: auto;
  width: min(760px, 100%);
  max-height: min(78vh, 860px);
  overflow: auto;
  border-radius: 18px;
  border: 1px solid rgba(148, 163, 184, 0.25);
  background: #ffffff;
  padding: 20px;
  box-shadow: 0 18px 60px rgba(15, 23, 42, 0.35);
}

.menu-modal-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 14px;
}

.menu-modal-header h2 {
  margin: 0;
  color: #172033;
}

.menu-close {
  border-radius: 10px;
  width: 34px;
  height: 34px;
  padding: 0;
  cursor: pointer;
}

</style>