<template>
  <div>
    <p v-if="loading" class="muted">Loading menu items...</p>
    <p v-else-if="error" class="muted">{{ error }}</p>
    <ul v-else-if="items.length" class="menu-items-list">
      <li v-for="item in items" :key="`${item.section ?? 'uncategorized'}-${item.name}`" class="menu-item-row perf">
        <div>
          <p class="menu-item-name">{{ item.name }}</p>
          <p v-if="item.description" class="menu-item-description">{{ item.description }}</p>
          <p v-if="item.section" class="menu-item-category">{{ item.section }}</p>
        </div>
        <strong v-if="item.price" class="menu-item-price">{{ item.price }}</strong>
      </li>
    </ul>
    <p v-else class="muted">No menu items found for this restaurant yet.</p>
  </div>
</template>

<script setup lang="ts">
interface MenuItem {
  section?: string
  name: string
  description?: string
  price?: string
}

withDefaults(defineProps<{
  items?: MenuItem[]
  loading?: boolean
  error?: string
}>(), {
  items: () => [],
  loading: false,
  error: '',
})
</script>

<style scoped>
.menu-items-list {
  list-style: none;
  margin: 0;
  padding: 0;
  display: grid;
  gap: 10px;
}

.menu-item-row {
  display: flex;
  align-items: flex-start;
  justify-content: space-between;
  gap: 14px;
  padding: 12px;
  border: 1px solid var(--color-border);
  border-radius: 12px;
  background: var(--color-surface-strong);
}

.menu-item-name {
  margin: 0;
  font-weight: 700;
  color: var(--color-text);
}

.menu-item-description {
  margin: 4px 0 0;
  color: var(--color-text-muted);
}

.menu-item-category {
  margin: 6px 0 0;
  font-size: 0.78rem;
  color: var(--color-accent);
}

.menu-item-price {
  color: var(--color-text);
  white-space: nowrap;
}
</style>
