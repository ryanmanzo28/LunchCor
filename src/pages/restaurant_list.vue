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

      <ul v-else class="favorites">
        <li v-for="restaurant in allRestaurants" :key="restaurant.id">
          <span>{{ restaurant.icon }}</span>
          <div>
            <strong>{{ restaurant.name }}</strong>
            <small>{{ restaurant.cuisine }} • {{ restaurant.orders }} orders • ★ {{ restaurant.rating.toFixed(1) }}</small>
          </div>
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

const initials = computed(() => (userStore.user?.name ?? 'LC').split(' ').map((name) => name[0]).join('').slice(0, 2))

if (import.meta.client) {
  void restaurantsStore.fetchRestaurants()
}
</script>