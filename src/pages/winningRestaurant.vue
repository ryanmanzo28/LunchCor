<script setup lang="ts">
import type { MenuItem } from '@/types/menu-item'

const restaurantsStore = useRestaurantsStore()
const menuInput = ref('')

const winningRestaurant = computed(() => restaurantsStore.getRestaurantWithMostVotes())

const menuItems = computed<MenuItem[]>(() => {
  const restaurant = winningRestaurant.value
  if (!restaurant) {
    return []
  }

  return restaurantsStore.getRestaurantMenuItems(restaurant.id) as MenuItem[]
})

useHead({
  title: winningRestaurant.value
    ? `LunchCor - ${winningRestaurant.value.name}`
    : 'LunchCor - Winning Restaurant',
  link: [{ rel: 'icon', href: '/favicon.ico' }],
})

onMounted(() => {
  const now = new Date()
  const isLunchWindow = now.getDay() === 3 && now.getHours() >= 11 && now.getHours() < 17

  if (!isLunchWindow || !winningRestaurant.value) {
    return navigateTo('/')
  }
})

function resolveImage(item: MenuItem) {
  return (item as MenuItem & { imageUrl?: string; photoUrl?: string }).imageUrl
    || (item as MenuItem & { imageUrl?: string; photoUrl?: string }).photoUrl
    || winningRestaurant.value?.icon
    || '/favicon.ico'
}

function formatPrice(item: MenuItem) {
  return item.priceCents == null ? 'Price TBD' : `$${(item.priceCents / 100).toFixed(2)}`
}
</script>

<template>
  <div class="page-shell">
    <section class="hero-card" v-memo="[winningRestaurant?.id, winningRestaurant?.name, winningRestaurant?.description, winningRestaurant?.cuisine]">
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

    <section class="menu-grid" aria-label="Winning restaurant menu" v-memo="[winningRestaurant?.id, menuItems.length]">
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
  color: var(--color-accent);
}

h1 {
  margin: 0;
  font-size: clamp(1.8rem, 3vw, 2.4rem);
}

.subtitle {
  margin: 10px 0 0;
  color: var(--color-text-muted);
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
  background: var(--color-surface);
  color: var(--color-accent);
  font-size: 0.82rem;
  font-weight: 700;
}

.entry-card {
  flex: 0 1 320px;
  display: flex;
  flex-direction: column;
  gap: 10px;
  padding: 16px;
  border: 1px solid var(--color-border);
  border-radius: 18px;
  background: var(--color-surface-strong);
  box-shadow: inset 0 0 0 1px rgba(15, 23, 42, 0.06);
}

label {
  font-weight: 700;
}

textarea {
  resize: vertical;
  min-height: 92px;
  border: 1px solid var(--color-border);
  border-radius: 12px;
  padding: 10px;
  font: inherit;
  background: var(--color-surface);
  color: var(--color-text);
}

.settings-link {
  color: var(--color-accent);
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
  background: var(--color-surface);
  color: var(--color-text-muted);
}

.menu-card {
  overflow: hidden;
  border-radius: 18px;
  background: var(--color-surface-strong);
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
  background: var(--color-bg);
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
  color: var(--color-accent);
}

.menu-card-description {
  margin: 8px 0 0;
  color: var(--color-text-muted);
}

.menu-card-section {
  margin: 8px 0 0;
  font-size: 0.8rem;
  font-weight: 700;
  color: var(--color-accent);
}

@media (max-width: 768px) {
  .menu-grid {
    grid-template-columns: 1fr;
  }
}
</style>