<script setup lang="ts">
import type { MenuItem } from '@/types/menu-item'

const restaurantsStore = useRestaurantsStore()
const winningRestaurant = computed(() => restaurantsStore.getRestaurantWithMostVotes())
const menuInput = ref('')

useHead({
  title: winningRestaurant.value
    ? `LunchCor - ${winningRestaurant.value.name}`
    : 'LunchCor - Winning Restaurant',
  link: [{ rel: 'icon', href: '/favicon.ico' }],
})

const now = new Date()
const isWednesday = now.getDay() === 3
const hour = now.getHours()
const isLunchWindow = isWednesday && hour >= 11 && hour < 17

const menuItems = computed<MenuItem[]>(() => {
  if (!winningRestaurant.value) {
    return []
  }

  return restaurantsStore.getRestaurantMenuItems(winningRestaurant.value.id) as MenuItem[]
})

onMounted(() => {
  if (!isLunchWindow || !winningRestaurant.value) {
    return navigateTo('/')
  }
})

function resolveImage(item: MenuItem) {
  const extras = item as MenuItem & { imageUrl?: string; photoUrl?: string }
  return extras.imageUrl || extras.photoUrl || winningRestaurant.value?.icon || '/favicon.ico'
}

function formatPrice(item: MenuItem) {
  if (item.priceCents === null || item.priceCents === undefined) {
    return 'Price TBD'
  }

  return `$${(item.priceCents / 100).toFixed(2)}`
}
</script>

<template>
  <div class="page-shell">
    <section class="hero-card">
      <div class="hero-copy">
        <p class="eyebrow">Lunch winner</p>
        <h1>{{ winningRestaurant?.name || 'No winner yet' }}</h1>
        <p class="subtitle">
          {{ winningRestaurant?.description || 'Check back during lunch hour for today’s pick.' }}
        </p>
        <div class="chip-row">
          <span class="chip">{{ winningRestaurant?.cuisine || 'Local favorite' }}</span>
          <span class="chip">Lunch window live</span>
        </div>
      </div>

      <div class="entry-card">
        <label for="menu-entry">Menu note</label>
        <textarea id="menu-entry" v-model="menuInput" rows="4" placeholder="Write today’s specials or a quick note..." />
        <NuxtLink to="/settings" class="settings-link">Open settings</NuxtLink>
      </div>
    </section>

    <section class="menu-grid" aria-label="Winning restaurant menu">
      <div v-if="!menuItems.length" class="empty-state">No menu items yet for this restaurant.</div>

      <article v-for="item in menuItems" :key="`${item.name}-${item.category || 'main'}`" class="menu-card">
        <img :src="resolveImage(item)" :alt="item.name" />
        <div class="menu-card-content">
          <div class="menu-card-header">
            <h3>{{ item.name }}</h3>
            <span>{{ formatPrice(item) }}</span>
          </div>
          <p class="menu-card-description">
            {{ item.description || 'A delicious option from today’s winner.' }}
          </p>
          <p v-if="item.category" class="menu-card-section">{{ item.category }}</p>
        </div>
      </article>
    </section>
  </div>
</template>

<style scoped>
.page-shell {
  min-height: 100vh;
  padding: 24px;
  background: linear-gradient(135deg, #fff7ed 0%, #f8fafc 100%);
  color: #172033;
}

.hero-card {
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
  justify-content: space-between;
  align-items: stretch;
  margin-bottom: 20px;
  padding: 24px;
  border-radius: 24px;
  background: rgba(255, 255, 255, 0.9);
  box-shadow: 0 18px 40px rgba(15, 23, 42, 0.08);
}

.hero-copy {
  flex: 1 1 320px;
}

.eyebrow {
  margin: 0 0 8px;
  text-transform: uppercase;
  letter-spacing: 0.22em;
  font-size: 0.78rem;
  font-weight: 700;
  color: #b45309;
}

h1 {
  margin: 0;
  font-size: clamp(1.8rem, 3vw, 2.4rem);
}

.subtitle {
  margin: 10px 0 0;
  color: #475569;
  max-width: 560px;
}

.chip-row {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
  margin-top: 14px;
}

.chip {
  border-radius: 999px;
  padding: 7px 10px;
  background: #fff7ed;
  color: #9a2c00;
  font-size: 0.82rem;
  font-weight: 700;
}

.entry-card {
  flex: 0 1 320px;
  display: flex;
  flex-direction: column;
  gap: 10px;
  padding: 16px;
  border-radius: 18px;
  background: #fff;
  box-shadow: inset 0 0 0 1px rgba(15, 23, 42, 0.06);
}

label {
  font-weight: 700;
}

textarea {
  resize: vertical;
  min-height: 92px;
  border: 1px solid #d1d5db;
  border-radius: 12px;
  padding: 10px;
  font: inherit;
}

.settings-link {
  color: #2563eb;
  font-size: 0.95rem;
  font-weight: 700;
  text-decoration: none;
}

.menu-grid {
  display: grid;
  grid-template-columns: repeat(2, minmax(0, 1fr));
  gap: 16px;
  max-height: 60vh;
  overflow-y: auto;
  padding-right: 6px;
}

.empty-state {
  grid-column: 1 / -1;
  padding: 22px;
  text-align: center;
  border-radius: 18px;
  background: rgba(255, 255, 255, 0.8);
  color: #64748b;
}

.menu-card {
  overflow: hidden;
  border-radius: 18px;
  background: white;
  box-shadow: 0 12px 24px rgba(15, 23, 42, 0.08);
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.menu-card:hover {
  transform: translateY(-3px);
  box-shadow: 0 16px 30px rgba(15, 23, 42, 0.14);
}

.menu-card img {
  width: 100%;
  height: 160px;
  object-fit: cover;
  background: #f1f5f9;
}

.menu-card-content {
  padding: 14px;
}

.menu-card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 8px;
}

.menu-card-header h3 {
  margin: 0;
  font-size: 1rem;
}

.menu-card-header span {
  font-weight: 700;
  color: #2563eb;
}

.menu-card-description {
  margin: 8px 0 0;
  color: #475569;
}

.menu-card-section {
  margin: 8px 0 0;
  font-size: 0.8rem;
  font-weight: 700;
  color: #0f766e;
}

@media (max-width: 768px) {
  .menu-grid {
    grid-template-columns: 1fr;
  }
}
</style>