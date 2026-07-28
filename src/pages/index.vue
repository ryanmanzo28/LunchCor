<template>
  <main class="dashboard">
    <header class="topbar">
      <NuxtLink class="brand" to="/">Lunch<span>Cor</span></NuxtLink>
      <div class="profile">
        <span class="avatar">{{ initials }}</span>
        <span>{{ userStore.user?.name ?? 'User' }}</span>
        <button class="text-button" type="button" @click="signOut">Sign out</button>
      </div>
    </header>

    <section class="hero">
      <div>
        <p class="eyebrow">{{ todayLabel }}</p>
        <h1>What are we having for lunch?</h1>
        <p class="hero-copy">Vote for your favorite. The most popular option leads today’s order.</p>
      </div>
      <button class="surprise-button" type="button" @click="restaurantsStore.pickSurprise">✦ Pick for us</button>
    </section>

    <p v-if="selectedRestaurant" class="notice" role="status">
      Your vote for <strong>{{ selectedRestaurant.name }}</strong> is in. Nice choice.
    </p>

    <p v-else-if="isLoading" class="notice" role="status">
      Loading today's restaurant options...
    </p>

    <p v-else-if="loadError" class="notice" role="status">
      {{ loadError }}
    </p>

    <section class="content-grid">
      <section aria-labelledby="vote-heading">
        <div class="section-heading">
          <div>
            <p class="eyebrow">Today’s ballot</p>
            <h2 id="vote-heading">Cast your vote</h2>
          </div>
          <span class="vote-count">{{ totalVotes }} votes</span>
        </div>

        <div v-if="rankedRestaurants.length" class="restaurant-list">
          <article
            v-for="restaurant in rankedRestaurants"
            :key="restaurant.id"
            class="restaurant-card"
            :class="{ selected: restaurant.id === selectedId }"
          >
            <div class="restaurant-icon" :style="{ background: restaurant.color }">
              {{ restaurant.icon }}
            </div>

            <div class="restaurant-details">
              <div class="restaurant-title">
                <h3>{{ restaurant.name }}</h3>
                <span class="cuisine">{{ restaurant.cuisine }}</span>
              </div>
              <p>{{ restaurant.description }}</p>
              <div class="meta">
                <span class="rating">★ {{ restaurant.rating.toFixed(1) }}</span>
                <span>{{ restaurant.orders }} team orders</span>
              </div>
            </div>

            <div class="vote-action">
              <strong>{{ restaurant.votes }}</strong>
              <span>votes</span>
              <button
                type="button"
                :aria-pressed="restaurant.id === selectedId"
                @click="restaurantsStore.voteFor(restaurant.id)"
              >
                {{ restaurant.id === selectedId ? 'Voted' : 'Vote' }}
              </button>
            </div>
          </article>
        </div>

        <p v-else class="muted">No restaurants are available right now.</p>
      </section>

      <aside class="sidebar">
        <section v-if="leader" class="panel" aria-labelledby="leader-heading">
          <p class="eyebrow">Currently leading</p>
          <h2 id="leader-heading">{{ leader.name }}</h2>
          <div class="leader-row">
            <span class="leader-icon" :style="{ background: leader.color }">{{ leader.icon }}</span>
            <span>{{ leader.votes }} votes so far</span>
          </div>
          <div class="progress">
            <span :style="{ width: `${leaderPercent}%` }"></span>
          </div>
          <p class="muted">Voting closes at 11:30 AM.</p>
        </section>

        <section class="panel" aria-labelledby="favorites-heading">
          <p class="eyebrow">Team favorites</p>
          <h2 id="favorites-heading">Most ordered</h2>
          <ol class="favorites">
            <li v-for="(restaurant, index) in popularRestaurants" :key="restaurant.id">
              <span>{{ index + 1 }}</span>
              <div>
                <strong>{{ restaurant.name }}</strong>
                <small>{{ restaurant.orders }} orders</small>
              </div>
            </li>
          </ol>
        </section>
      </aside>
    </section>
  </main>
</template>

<script setup lang="ts">
useHead({
  title: 'Home',
  link: [
    { rel: 'icon', href: '/favicon.ico' },
  ],
})

const router = useRouter()
const authStore = useAuthStore()
const userStore = useUserStore()
const restaurantsStore = useRestaurantsStore()

const {
  rankedRestaurants,
  popularRestaurants,
  leader,
  totalVotes,
  leaderPercent,
  selectedId,
  selectedRestaurant,
  isLoading,
  loadError,
} = storeToRefs(restaurantsStore)

const initials = computed(() => (userStore.user?.name ?? 'LC').split(' ').map((name) => name[0]).join('').slice(0, 2))

const todayLabel = new Intl.DateTimeFormat('en-US', {
  weekday: 'long',
  month: 'long',
  day: 'numeric',
}).format(new Date())

function signOut() {
  authStore.clearToken()
  userStore.clearUser()
  router.push('/login')
}

if (import.meta.client) {
  void restaurantsStore.fetchRestaurants()
}
</script>