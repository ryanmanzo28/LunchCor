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
          <LazyRestaurantCard
            :name="restaurant.name"
            :description="restaurant.description"
            :rating="restaurant.rating"
            :icon="restaurant.icon"
            :color="restaurant.color"
          />
        </li>
      </ul>
    </section>
  </main>
</template>

<script setup lang="ts">
useHead({
  title: 'List of Restaurants',
  link: [
    { rel: 'icon', href: '/favicon.ico' },
  ],
})

const userStore = useUserStore()
const restaurantsStore = useRestaurantsStore()
const { restaurants: allRestaurants, isLoading, loadError } = storeToRefs(restaurantsStore)

// Match avatar style from the main dashboard.
const initials = computed(() => (userStore.user?.name ?? 'LC').split(' ').map((name) => name[0]).join('').slice(0, 2))
if (import.meta.client) {
  void restaurantsStore.fetchRestaurants()
}

</script>

<style scoped>
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
}

.restaurant-item {
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
</style>