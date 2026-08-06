<script setup lang="ts">
interface AnalyticsRow {
  restaurant_id: number
  restaurant_name: string
  meal_id: number
  meal_name: string
  order_count: number
}

const props = defineProps<{
  rows: AnalyticsRow[]
  startDate: string
  endDate: string
}>()

const restaurantSummaries = computed(() => {
  const summaries = new Map<number, { id: number, name: string, orders: number, topMeal: string, topMealCount: number }>()

  for (const row of props.rows) {
    const current = summaries.get(row.restaurant_id) ?? {
      id: row.restaurant_id,
      name: row.restaurant_name,
      orders: 0,
      topMeal: row.meal_name,
      topMealCount: 0,
    }

    current.orders += Number(row.order_count)

    if (Number(row.order_count) > current.topMealCount) {
      current.topMeal = row.meal_name
      current.topMealCount = Number(row.order_count)
    }

    summaries.set(row.restaurant_id, current)
  }

  return [...summaries.values()].sort((left, right) => right.orders - left.orders)
})

const totalOrders = computed(() => props.rows.reduce((sum, row) => sum + Number(row.order_count), 0))
const totalMeals = computed(() => props.rows.length)
const topRestaurant = computed(() => restaurantSummaries.value[0] ?? null)
</script>

<template>
  <section class="analytics-results" aria-live="polite">
    <header class="results-header">
      <div>
        <p class="eyebrow">Analytics snapshot</p>
        <h2>{{ startDate }} to {{ endDate }}</h2>
      </div>
      <p class="results-copy">Order volume grouped by restaurant and menu item.</p>
    </header>

    <div class="stats-grid">
      <article class="stat-card">
        <span>Total orders</span>
        <strong>{{ totalOrders }}</strong>
      </article>
      <article class="stat-card">
        <span>Tracked meals</span>
        <strong>{{ totalMeals }}</strong>
      </article>
      <article class="stat-card">
        <span>Leading restaurant</span>
        <strong>{{ topRestaurant?.name ?? 'No data' }}</strong>
        <small v-if="topRestaurant">{{ topRestaurant.orders }} orders</small>
      </article>
    </div>

    <div v-if="restaurantSummaries.length" class="leaderboard">
      <article
        v-for="restaurant in restaurantSummaries"
        :key="restaurant.id"
        class="leader-card"
        v-memo="[restaurant.id, restaurant.orders, restaurant.topMealCount]"
      >
        <div>
          <h3>{{ restaurant.name }}</h3>
          <p>Top meal: {{ restaurant.topMeal }}</p>
        </div>
        <strong>{{ restaurant.orders }}</strong>
      </article>
    </div>

    <div class="table-shell">
      <table>
        <thead>
          <tr>
            <th>Restaurant</th>
            <th>Meal</th>
            <th>Orders</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="row in rows" :key="`${row.restaurant_id}-${row.meal_id}`">
            <td>{{ row.restaurant_name }}</td>
            <td>{{ row.meal_name }}</td>
            <td>{{ row.order_count }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </section>
</template>

<style scoped>
.analytics-results {
  display: grid;
  gap: 18px;
}

.results-header {
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

.results-header h2,
.leader-card h3 {
  margin: 0;
  color: #1f3249;
}

.results-copy,
.leader-card p,
.stat-card span,
.stat-card small {
  margin: 0;
  color: #617287;
}

.stats-grid {
  display: grid;
  gap: 12px;
  grid-template-columns: repeat(3, minmax(0, 1fr));
}

.stat-card,
.leader-card {
  border: 1px solid #e5eaf1;
  border-radius: 16px;
  padding: 16px;
  background: linear-gradient(180deg, #ffffff, #fbfcfe);
}

.stat-card strong,
.leader-card strong {
  display: block;
  margin-top: 8px;
  color: #11253b;
  font-size: 1.6rem;
}

.leaderboard {
  display: grid;
  gap: 12px;
  grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
}

.leader-card {
  display: flex;
  align-items: end;
  justify-content: space-between;
  gap: 12px;
}

.table-shell {
  overflow: auto;
  border: 1px solid #e5eaf1;
  border-radius: 16px;
}

table {
  width: 100%;
  border-collapse: collapse;
  min-width: 560px;
}

th,
td {
  padding: 14px 16px;
  text-align: left;
}

thead {
  background: #f4f7fb;
}

tbody tr + tr td {
  border-top: 1px solid #edf1f5;
}

@media (max-width: 760px) {
  .stats-grid {
    grid-template-columns: 1fr;
  }
}
</style>