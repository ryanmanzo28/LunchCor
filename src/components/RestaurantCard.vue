<template>
  <article class="restaurant-card perf" :style="cardStyle">
    <div class="icon-slot" aria-hidden="true">
      <LazyNuxtImg
        v-if="iconIsImage"
        :src="icon"
        :alt="`${name} icon`"
        width="72"
        height="72"
        format="webp"
        densities="1x 2x"
        loading="lazy"
        class="icon-image"
      />
      <span v-else-if="icon" class="icon-text">{{ icon }}</span>
      <span v-else class="icon-placeholder">{{ fallbackInitial }}</span>
    </div>

    <div class="content">
      <h3 class="name">{{ name }}</h3>
      <p class="description">{{ description }}</p>

      <div class="rating" :aria-label="ratingLabel">
        <span
          v-for="star in stars"
          :key="star.index"
          class="star"
          :class="star.state"
          aria-hidden="true"
        >
          {{ star.symbol }}
        </span>
        <span class="rating-value">{{ rating.toFixed(1) }}</span>
      </div>
    </div>
  </article>
</template>

<script setup lang="ts">
const props = withDefaults(defineProps<{
  name: string
  description: string
  rating: number
  icon?: string
  color?: string
}>(), {
  icon: '',
  color: '#9aa5b1',
})

const cardStyle = computed(() => ({
  '--restaurant-color': props.color,
}))

const fallbackInitial = computed(() => props.name.trim().charAt(0).toUpperCase() || 'R')

const iconIsImage = computed(() => /^https?:\/\//i.test(props.icon) || props.icon.startsWith('/') || props.icon.startsWith('data:'))

const stars = computed(() => {
  const safeRating = Math.max(0, Math.min(5, props.rating))
  const filledStars = Math.round(safeRating)

  return Array.from({ length: 5 }, (_, index) => ({
    index,
    state: index < filledStars ? 'filled' : 'empty',
    symbol: index < filledStars ? '★' : '☆',
  }))
})

const ratingLabel = computed(() => `${props.rating.toFixed(1)} out of 5 stars`)
</script>

<style scoped>
.restaurant-card {
  display: grid;
  grid-template-columns: 72px minmax(0, 1fr);
  gap: 14px;
  align-items: center;
  padding: 16px;
  border: 1px solid rgba(137, 151, 173, 0.2);
  border-radius: 18px;
  background: rgba(255, 255, 255, 0.86);
  box-shadow: 0 10px 30px rgba(15, 23, 42, 0.06);
  backdrop-filter: blur(14px);
  transition: transform 180ms ease, box-shadow 180ms ease, border-color 180ms ease;
  will-change: transform, box-shadow;
}

.restaurant-card:hover {
  transform: translateY(-3px);
  box-shadow: 0 16px 38px rgba(15, 23, 42, 0.12);
  border-color: color-mix(in srgb, var(--restaurant-color) 42%, rgba(137, 151, 173, 0.2));
}

.icon-slot {
  width: 72px;
  height: 72px;
  border-radius: 18px;
  display: grid;
  place-items: center;
  background: linear-gradient(135deg, var(--restaurant-color), color-mix(in srgb, var(--restaurant-color) 55%, white));
  color: #fff;
  font-weight: 800;
  font-size: 1.2rem;
  letter-spacing: 0.03em;
  overflow: hidden;
}

.icon-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.icon-placeholder,
.icon-text {
  line-height: 1;
}

.content {
  min-width: 0;
}

.name {
  margin: 0 0 6px;
  font-size: 1.05rem;
  line-height: 1.2;
  color: #172033;
}

.description {
  margin: 0 0 10px;
  color: #5c667a;
  line-height: 1.5;
}

.rating {
  display: flex;
  align-items: center;
  gap: 4px;
  color: #f59e0b;
}

.star {
  font-size: 0.98rem;
  line-height: 1;
}

.star.empty {
  color: #d3d8e2;
}

.rating-value {
  margin-left: 6px;
  color: #697387;
  font-weight: 600;
  font-size: 0.92rem;
}

@media (max-width: 640px) {
  .restaurant-card {
    grid-template-columns: 1fr;
  }

  .icon-slot {
    width: 60px;
    height: 60px;
  }
}
</style>