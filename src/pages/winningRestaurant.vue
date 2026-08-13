<script setup lang="ts">
import type { MenuItem } from '@/types/menu-item'
import type { RestaurantReview, RestaurantReviewsResponse } from '@/types/review'
import { useLazyAPIData } from '@/composables/useAPI'

const restaurantsStore = useRestaurantsStore()
const selectedRating = ref(5)
const reviewInput = ref('')
const isSubmittingReview = ref(false)
const reviewMessage = ref('')
const reviewError = ref('')
const isReviewsLoading = ref(false)
const reviewsRefreshToken = ref(0)
const reviewsSummary = ref<RestaurantReviewsResponse | null>(null)

const winningRestaurant = computed(() => restaurantsStore.getRestaurantWithMostVotes())

const menuItems = computed<MenuItem[]>(() => {
  const restaurant = winningRestaurant.value
  if (!restaurant) {
    return []
  }

  return restaurantsStore.getRestaurantMenuItems(restaurant.id) as MenuItem[]
})

const recentReviews = computed<RestaurantReview[]>(() => reviewsSummary.value?.reviews ?? [])

const reviewStatsLabel = computed(() => {
  if (!reviewsSummary.value || reviewsSummary.value.totalReviews === 0) {
    return 'No ratings yet. Be the first to leave one.'
  }

  return `${reviewsSummary.value.averageRating.toFixed(2)} average from ${reviewsSummary.value.totalReviews} ratings`
})

async function fetchReviews() {
  const restaurant = winningRestaurant.value

  if (!restaurant) {
    reviewsSummary.value = null
    return
  }

  isReviewsLoading.value = true
  reviewError.value = ''

  try {
    const { data, error } = await useLazyAPIData<RestaurantReviewsResponse>(
      `/restaurants/${restaurant.id}/reviews`,
      {
        key: `restaurant-reviews-${restaurant.id}-${reviewsRefreshToken.value}`,
        server: false,
      },
    )

    if (error.value) {
      throw error.value
    }

    if (!data.value) {
      throw createError({
        statusCode: 500,
        statusMessage: 'Empty reviews response',
      })
    }

    reviewsSummary.value = data.value
  }
  catch {
    reviewError.value = 'Unable to load reviews right now.'
  }
  finally {
    isReviewsLoading.value = false
  }
}

async function submitReview() {
  const restaurant = winningRestaurant.value

  if (!restaurant || isSubmittingReview.value) {
    return
  }

  isSubmittingReview.value = true
  reviewMessage.value = ''
  reviewError.value = ''

  try {
    const { data, error } = await useLazyAPIData<{ success: boolean, message: string }>(
      `/restaurants/${restaurant.id}/reviews`,
      {
        key: `restaurant-review-submit-${restaurant.id}-${Date.now()}`,
        server: false,
        fetch: {
          method: 'POST',
          body: {
            rating: selectedRating.value,
            review: reviewInput.value,
          },
        },
      },
    )

    if (error.value) {
      const statusCode = Number(error.value.statusCode ?? 500)

      if (statusCode === 409) {
        reviewError.value = 'You already reviewed this restaurant today.'
        return
      }

      reviewError.value = 'Unable to submit your review right now.'
      return
    }

    if (!data.value?.success) {
      reviewError.value = 'Unable to submit your review right now.'
      return
    }

    reviewMessage.value = data.value.message || 'Review submitted.'
    reviewInput.value = ''
    reviewsRefreshToken.value += 1

    await Promise.all([
      fetchReviews(),
      restaurantsStore.fetchRestaurants(true),
    ])
  }
  finally {
    isSubmittingReview.value = false
  }
}

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

  void fetchReviews()
})

watch(
  () => winningRestaurant.value?.id,
  () => {
    reviewMessage.value = ''
    reviewError.value = ''
    reviewsRefreshToken.value += 1
    void fetchReviews()
  },
)

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
        <label for="rating-select">Rate this lunch</label>
        <select id="rating-select" v-model.number="selectedRating">
          <option :value="5">5 - Loved it</option>
          <option :value="4">4 - Really good</option>
          <option :value="3">3 - Solid</option>
          <option :value="2">2 - Not great</option>
          <option :value="1">1 - Would not order again</option>
        </select>

        <label for="review-entry">Quick review</label>
        <textarea
          id="review-entry"
          v-model="reviewInput"
          rows="4"
          maxlength="1000"
          placeholder="Share what you ordered and whether you would order it again..."
        />

        <button type="button" class="primary-button" :disabled="isSubmittingReview" @click="submitReview">
          {{ isSubmittingReview ? 'Submitting...' : 'Submit review' }}
        </button>

        <p v-if="reviewMessage" class="review-feedback success">{{ reviewMessage }}</p>
        <p v-if="reviewError" class="review-feedback error">{{ reviewError }}</p>
        <p class="review-stats">{{ reviewStatsLabel }}</p>
      </div>
    </section>

    <section class="menu-grid perf" aria-label="Winning restaurant menu" v-memo="[winningRestaurant?.id, menuItems.length]">
      <div v-if="!menuItems.length" class="empty-state">No menu items yet for this restaurant.</div>

      <LazyWinningMenuCard
        v-for="item in menuItems"
        :key="`${item.name}-${item.category || 'main'}`"
        :item="item"
        :fallback-image="winningRestaurant?.icon || '/favicon.ico'"
      />
    </section>

    <section class="reviews-panel" aria-label="Recent restaurant reviews">
      <header class="reviews-header">
        <h2>Recent reviews</h2>
        <p v-if="isReviewsLoading" class="muted">Loading reviews...</p>
      </header>

      <p v-if="!isReviewsLoading && !recentReviews.length" class="muted">No reviews posted yet for this restaurant.</p>

      <ul v-else class="review-list">
        <li v-for="entry in recentReviews" :key="entry.id" class="review-item">
          <div class="review-top-row">
            <strong>{{ entry.userName }}</strong>
            <span class="review-rating">{{ entry.rating }}/5</span>
          </div>
          <p v-if="entry.review" class="review-copy">{{ entry.review }}</p>
          <p class="review-date">{{ entry.reviewDate }}</p>
        </li>
      </ul>
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

select {
  border: 1px solid var(--color-border);
  border-radius: 12px;
  padding: 10px;
  font: inherit;
  background: var(--color-surface);
  color: var(--color-text);
}

.primary-button {
  border: 0;
  border-radius: 12px;
  padding: 10px 12px;
  font-weight: 700;
  color: #fff;
  background: var(--color-accent);
}

.primary-button:disabled {
  cursor: not-allowed;
  opacity: 0.7;
}

.review-feedback {
  margin: 0;
  font-size: 0.9rem;
}

.review-feedback.success {
  color: #216b4a;
}

.review-feedback.error {
  color: #a53a24;
}

.review-stats {
  margin: 0;
  color: var(--color-text-muted);
  font-size: 0.85rem;
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

.reviews-panel {
  margin-top: 20px;
  border: 1px solid var(--color-border);
  border-radius: 20px;
  background: rgba(255, 255, 255, 0.9);
  padding: 18px;
}

.reviews-header {
  display: flex;
  align-items: baseline;
  justify-content: space-between;
  gap: 10px;
}

.reviews-header h2 {
  margin: 0;
}

.muted {
  margin: 0;
  color: var(--color-text-muted);
}

.review-list {
  margin: 14px 0 0;
  padding: 0;
  list-style: none;
  display: grid;
  gap: 10px;
}

.review-item {
  border: 1px solid var(--color-border);
  border-radius: 12px;
  padding: 10px 12px;
  background: var(--color-surface-strong);
}

.review-top-row {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 8px;
}

.review-rating {
  color: #9a6800;
  font-weight: 700;
}

.review-copy {
  margin: 8px 0 0;
  color: var(--color-text);
}

.review-date {
  margin: 8px 0 0;
  font-size: 0.8rem;
  color: var(--color-text-muted);
}

@media (max-width: 768px) {
  .menu-grid {
    grid-template-columns: 1fr;
  }
}
</style>