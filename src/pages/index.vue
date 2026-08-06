<script setup lang="ts">
import { normalizeCount } from '@/utils/restaurants'

useHead({
  title: 'LunchCor Home',
  link: [{ rel: 'icon', href: '/favicon.ico' }],
})
const userStore = useUserStore()
const restaurantsStore = useRestaurantsStore()
const fallbackTopIds = useState<number[]>('home-fallback-top-ids', () => [])
const isWednesday = new Date().getDay() === 3;

const allTimesVotedZero = computed(() => restaurantsStore.restaurants.every((restaurant) => normalizeCount(restaurant.timesVoted) === 0))

const topRestaurants = computed(() => {
  const list = restaurantsStore.restaurants
    .filter((restaurant): restaurant is NonNullable<typeof restaurant> => Boolean(restaurant))

  if (list.length <= 3) {
    return list
  }

  if (!allTimesVotedZero.value) {
    return [...list]
      .sort((left, right) => {
        const byVotes = normalizeCount(right.timesVoted) - normalizeCount(left.timesVoted)
        if (byVotes !== 0) {
          return byVotes
        }

        return left.name.localeCompare(right.name)
      })
      .slice(0, 3)
  }

  if (fallbackTopIds.value.length !== 3) {
    const pool = [...list]
    const pickedIds: number[] = []

    while (pickedIds.length < 3 && pool.length > 0) {
      const index = Math.floor(Math.random() * pool.length)
      const [picked] = pool.splice(index, 1)
      if (picked) {
        pickedIds.push(picked.id)
      }
    }

    fallbackTopIds.value = pickedIds
  }

  const mapped = fallbackTopIds.value
    .map((id) => list.find((restaurant) => restaurant.id === id))
    .filter((restaurant): restaurant is NonNullable<typeof restaurant> => Boolean(restaurant))

  if (mapped.length === 3) {
    return mapped
  }

  return list.slice(0, 3)
})

const maxVotes = computed(() => Math.max(...topRestaurants.value.map((restaurant) => normalizeCount(restaurant.timesVoted)), 0))
if (import.meta.client) {
  void restaurantsStore.fetchRestaurants()

}

</script>

<template>
  <main class="home-page">
    <section class="graph-shell">
      <LazyNuxtImg
        class="user-profile-picture"
        :src="userStore.avatar"
        alt="User avatar"
      />
      <button v-if="isWednesday && new Date().getHours() < 11" @click="navigateTo('/voting')" class="vote-button">Vote for Lunch Today</button>
      <h1>Top 3 Restaurants</h1>
      <p>Times voted</p>

      <div class="bar-chart" aria-label="Top 3 restaurants by times voted">
        <div
          v-for="restaurant in topRestaurants"
          :key="restaurant.id"
          class="bar-column"
        >
          <strong class="bar-count">{{ normalizeCount(restaurant.timesVoted) }}</strong>
          <div class="bar-track">
            <div
              class="bar-fill"
              :style="{
                height: maxVotes.valueOf() > 0 ? `${Math.max((normalizeCount(restaurant.timesVoted) / maxVotes.valueOf()) * 100, 4)}%` : '4%',
              }"
            >
              <span class="bar-name">{{ restaurant.name }}</span>
              <button v-if="isAdminUser()" class="admin-dashboard-button" @click="navigateTo('/admin/adminDashboard')">Admin Dashboard</button>

                            
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>
</template>

<style scoped>
.admin-dashboard-button {
  margin-top: 8px;
  border: 1px solid var(--line);
  border-radius: 8px;
  padding: 6px 10px;
  background: #ffffff;
  color: var(--deep);
  font-size: 0.74rem;
  font-weight: 700;
}

.admin-dashboard-button:hover {
  background: #f2f5f8;
}

.vote-button {
  margin: 10px 0 14px;
  border: 0;
  border-radius: 10px;
  padding: 10px 14px;
  background: var(--accent);
  color: #ffffff;
  font-size: 0.86rem;
  font-weight: 700;
  box-shadow: 0 7px 14px #d95d3930;
}

.vote-button:hover {
  background: #bf4c2d;
}

.home-page {
  content-visibility: auto;
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 24px;
}

.graph-shell {
  width: min(720px, 100%);
  padding: 24px;
  border: 1px solid var(--line);
  border-radius: 16px;
  background: #ffffff;
  box-shadow: 0 10px 30px rgba(15, 23, 42, 0.06);
  text-align: center;
}

.user-profile-picture {
  width: 72px;
  height: 72px;
  border-radius: 50%;
  object-fit: cover;
  margin-bottom: 12px;
}

.graph-shell h1 {
  color: var(--ink);
}

.graph-shell p {
  color: var(--muted);
}

.bar-chart {
  display: flex;
  align-items: end;
  justify-content: center;
  gap: 24px;
  min-height: 320px;
  margin-top: 24px;
}

.bar-column {
  content-visibility: auto;
  color: var(--accent);
  width: 160px;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 8px;
}

.bar-track {
  width: 56px;
  height: 220px;
  display: flex;
  align-items: end;
  border: 1px solid currentColor;
}

.bar-fill {
  width: 100%;
  background: currentColor;
  display: flex;
  align-items: start;
  justify-content: center;
  transition: height 180ms ease;
  will-change: height;
}

.bar-name {
  margin-top: 2px;
  font-size: 11px;
  line-height: 1;
  color: var(--ink);
  text-align: center;
  padding: 0 2px;
}

.bar-count {
  line-height: 1;
}
</style>