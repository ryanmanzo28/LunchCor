<script setup lang="ts">
import { useLazyAPIData } from '@/composables/useAPI'

interface AnalyticsRow {
  restaurant_id: number
  restaurant_name: string
  meal_id: number
  meal_name: string
  order_count: number
}

interface AnalyticsResponse {
  startDate: string
  endDate: string
  analytics: AnalyticsRow[]
}

definePageMeta({
  layout: 'admin',
  middleware: ['admin'],
})

useHead({
  title: 'Admin Analytics',
  link: [{ rel: 'icon', href: '/favicon.ico' }],
})

const authStore = useAuthStore()
const password = ref('')
const startDate = ref(new Date(new Date().setDate(new Date().getDate() - 7)).toISOString().slice(0, 10))
const endDate = ref(new Date().toISOString().slice(0, 10))
const analyticsRows = ref<AnalyticsRow[]>([])
const isLoading = ref(false)
const loadError = ref('')
const hasLoaded = ref(false)

async function loadAnalytics() {
  if (!authStore.userId) {
    loadError.value = 'Admin session is missing a user id.'
    return
  }

  if (!password.value) {
    loadError.value = 'Enter your password to load analytics.'
    return
  }

  isLoading.value = true
  loadError.value = ''

  try {
    const { data } = await useLazyAPIData<AnalyticsResponse>(
      `/admin/analytics?id=${authStore.userId}&password=${encodeURIComponent(password.value)}&startDate=${startDate.value}&endDate=${endDate.value}`,
      {
        fetch: { method: 'GET' },
      },
    )
    const response = data.value

    if (!response) {
      throw createError({
        statusCode: 500,
        statusMessage: 'Empty analytics response',
      })
    }

    analyticsRows.value = response.analytics
    hasLoaded.value = true
  }
  catch (error: any) {
    loadError.value = error?.statusMessage || 'Unable to load analytics right now.'
  }
  finally {
    isLoading.value = false
  }
}
</script>

<template>
  <section class="analytics-page">
    <div class="page-header">
      <div>
        <p class="eyebrow">Reporting</p>
        <h2>Order analytics</h2>
      </div>
      <p>Pull a lightweight order breakdown without eagerly hydrating the results view.</p>
    </div>

    <AdminCard title="Filters">
      <form class="analytics-form" @submit.prevent="loadAnalytics">
        <label>
          <span>Start date</span>
          <input v-model="startDate" type="date" required>
        </label>

        <label>
          <span>End date</span>
          <input v-model="endDate" type="date" required>
        </label>

        <label class="password-field">
          <span>Admin password</span>
          <input v-model="password" type="password" autocomplete="current-password" placeholder="Re-enter password" required>
        </label>

        <button type="submit" :disabled="isLoading">
          {{ isLoading ? 'Loading...' : 'Load analytics' }}
        </button>
      </form>

      <p v-if="loadError" class="feedback error" role="alert">{{ loadError }}</p>
      <p v-else-if="!hasLoaded" class="feedback">Run a query to inspect restaurant and meal demand.</p>
      <p v-else-if="!analyticsRows.length" class="feedback">No analytics rows found for that range.</p>
    </AdminCard>

    <LazyAdminAnalyticsResults
      v-if="analyticsRows.length"
      hydrate-on-idle
      :rows="analyticsRows"
      :start-date="startDate"
      :end-date="endDate"
    />
  </section>
</template>

<style scoped>
.analytics-page {
  display: grid;
  gap: 18px;
}

.page-header {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  gap: 12px;
  align-items: end;
}

.eyebrow {
  margin: 0 0 6px;
  color: #c75a2e;
  text-transform: uppercase;
  letter-spacing: 0.14em;
  font-size: 0.72rem;
  font-weight: 700;
}

.page-header h2,
.page-header p,
.feedback,
.analytics-form span {
  margin: 0;
}

.page-header h2 {
  color: #1f3249;
}

.page-header p,
.feedback,
.analytics-form span {
  color: #617287;
}

.analytics-form {
  display: grid;
  gap: 14px;
  grid-template-columns: repeat(2, minmax(0, 1fr));
}

.analytics-form label {
  display: grid;
  gap: 8px;
}

.password-field {
  grid-column: 1 / -1;
}

.analytics-form input {
  min-height: 44px;
  border: 1px solid #d5dde8;
  border-radius: 12px;
  padding: 10px 12px;
  font: inherit;
}

.analytics-form button {
  min-height: 44px;
  border: 0;
  border-radius: 12px;
  background: #1a3859;
  color: #fff;
  font-weight: 700;
}

.feedback {
  margin-top: 12px;
}

.feedback.error {
  color: #b42318;
}

@media (max-width: 760px) {
  .analytics-form {
    grid-template-columns: 1fr;
  }
}
</style>