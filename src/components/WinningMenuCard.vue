<script setup lang="ts">
import type { MenuItem } from '@/types/menu-item'

const props = defineProps<{
  item: MenuItem
  fallbackImage?: string
}>()

const resolvedImage = computed(() => {
  const menuItem = props.item as MenuItem & { imageUrl?: string; photoUrl?: string }
  return menuItem.imageUrl || menuItem.photoUrl || props.fallbackImage || '/favicon.ico'
})

const formattedPrice = computed(() => (
  props.item.priceCents == null ? 'Price TBD' : `$${(props.item.priceCents / 100).toFixed(2)}`
))
</script>

<template>
  <article class="menu-card">
    <LazyNuxtImg :src="resolvedImage" :alt="item.name" class="menu-card-image" />
    <div class="menu-card-content">
      <div class="menu-card-header">
        <h3>{{ item.name }}</h3>
        <span>{{ formattedPrice }}</span>
      </div>
      <p class="menu-card-description">
        {{ item.description || 'A delicious option from today’s winner.' }}
      </p>
      <p v-if="item.category" class="menu-card-section">{{ item.category }}</p>
    </div>
  </article>
</template>

<style scoped>
.menu-card {
  overflow: hidden;
  border-radius: 18px;
  background: var(--color-surface-strong);
  box-shadow: 0 12px 24px rgba(15, 23, 42, 0.08);
  cursor: pointer;
  transition: transform 0.2s ease, box-shadow 0.2s ease;
  will-change: transform, box-shadow;
}

.menu-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 16px 30px rgba(15, 23, 42, 0.14);
}

.menu-card:hover .menu-card-image {
  transform: scale(1.03);
}

.menu-card-image {
  width: 100%;
  height: 160px;
  object-fit: cover;
  background: var(--color-bg);
  transition: transform 0.25s ease;
  will-change: transform;
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
</style>