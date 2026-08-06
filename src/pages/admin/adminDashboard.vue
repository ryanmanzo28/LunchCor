<script setup lang="ts">
import { useLazyAPIData } from '@/composables/useAPI'

definePageMeta({
    layout: 'admin',
    middleware: ['admin'],
})

useHead({
    title: 'Admin Dashboard',
    link: [{ rel: 'icon', href: '/favicon.ico' }],
})

const authStore = useAuthStore()
const restaurantsStore = useRestaurantsStore()
const { restaurants, isLoading, loadError, totalVotes } = storeToRefs(restaurantsStore)
const adminPassword = ref('')
const actionError = ref('')
const actionMessage = ref('')
const isClearingVotes = ref(false)

const restaurantCount = computed(() => restaurants.value.length)
const topRestaurant = computed(() => [...restaurants.value].sort((left, right) => right.votes - left.votes)[0] ?? null)

// Prime admin dashboard with restaurant inventory on first client render.
if (import.meta.client) {
    void restaurantsStore.fetchRestaurants()
}

async function clearVotes() {
    if (!authStore.userId) {
        actionError.value = 'Admin session is missing a user id.'
        return
    }

    if (!adminPassword.value) {
        actionError.value = 'Enter your password to clear votes.'
        return
    }

    isClearingVotes.value = true
    actionError.value = ''
    actionMessage.value = ''

    try {
        const { data } = await useLazyAPIData<{ success: boolean, message: string }>('/admin/votes/votes', {
            fetch: {
                method: 'DELETE',
                body: {
                    userId: authStore.userId,
                    password: adminPassword.value,
                },
            },
        })
        const response = data.value

        if (!response) {
            throw createError({
                statusCode: 500,
                statusMessage: 'Empty clear-votes response',
            })
        }

        restaurantsStore.clearSelectedVote()
        await restaurantsStore.fetchRestaurants(true)
        actionMessage.value = response.message
    }
    catch (error: any) {
        actionError.value = error?.statusMessage || 'Unable to clear votes right now.'
    }
    finally {
        isClearingVotes.value = false
    }
}
</script>

<style scoped>
.admin-grid {
    display: grid;
    gap: 14px;
    grid-template-columns: repeat(2, minmax(0, 1fr));
}

.muted {
    margin: 0;
    color: #566579;
}

.eyebrow {
    margin: 0 0 6px;
    color: #c75a2e;
    text-transform: uppercase;
    letter-spacing: 0.14em;
    font-size: 0.72rem;
    font-weight: 700;
}

.stats-grid {
    display: grid;
    gap: 12px;
    grid-template-columns: repeat(3, minmax(0, 1fr));
}

.stat-card {
    border: 1px solid #e5eaf1;
    border-radius: 16px;
    padding: 16px;
    background: linear-gradient(180deg, #ffffff, #fbfcfe);
}

.stat-card span,
.actions-copy,
.quick-link,
.restaurant-row small,
.status-copy {
    color: #566579;
}

.stat-card strong {
    display: block;
    margin-top: 8px;
    color: #1f3249;
    font-size: 1.7rem;
}

.card-stack,
.action-form {
    display: grid;
    gap: 12px;
}

.action-form label {
    display: grid;
    gap: 8px;
}

.action-form input {
    min-height: 44px;
    border: 1px solid #d5dde8;
    border-radius: 12px;
    padding: 10px 12px;
    font: inherit;
}

.action-form button,
.quick-link {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    min-height: 44px;
    border-radius: 12px;
    font-weight: 700;
    text-decoration: none;
}

.action-form button {
    border: 0;
    background: #9f1f1f;
    color: #fff;
}

.quick-link {
    padding: 0 16px;
    border: 1px solid #d5dde8;
    background: #f7f9fc;
}

.feedback-error,
.feedback-success {
    margin: 0;
    font-size: 0.92rem;
}

.feedback-error {
    color: #b42318;
}

.feedback-success {
    color: #0f766e;
}

.restaurant-list {
    margin: 0;
    padding: 0;
    list-style: none;
    display: grid;
    gap: 12px;
}

.restaurant-row {
    display: flex;
    align-items: center;
    gap: 10px;
}

.restaurant-row strong,
.restaurant-row small {
    display: block;
}

.restaurant-row small {
    color: #566579;
}

.badge {
    display: grid;
    place-items: center;
    width: 28px;
    height: 28px;
    border-radius: 6px;
    color: #243247;
    font-weight: 700;
}

.section-heading {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    gap: 12px;
    align-items: end;
    margin-bottom: 12px;
}

.section-heading h2,
.card-stack h2 {
    margin: 0;
}

@media (max-width: 980px) {
    .admin-grid,
    .stats-grid {
        grid-template-columns: 1fr;
    }
}
</style>
<template>
    <section class="admin-grid">
        <AdminCard title="Service Snapshot">
            <div class="stats-grid">
                <article class="stat-card">
                    <span>Restaurants</span>
                    <strong>{{ restaurantCount }}</strong>
                </article>
                <article class="stat-card">
                    <span>Votes in play</span>
                    <strong>{{ totalVotes }}</strong>
                </article>
                <article class="stat-card">
                    <span>Current leader</span>
                    <strong>{{ topRestaurant?.name ?? 'No leader' }}</strong>
                </article>
            </div>
        </AdminCard>

        <AdminCard title="Vote Controls">
            <div class="card-stack">
                <p class="actions-copy">Use this when a lunch round needs to be reset manually. This clears all vote records and zeroes the restaurant counters.</p>

                <form class="action-form" @submit.prevent="clearVotes">
                    <label>
                        <span>Confirm with admin password</span>
                        <input v-model="adminPassword" type="password" autocomplete="current-password" placeholder="Re-enter password">
                    </label>

                    <button type="submit" :disabled="isClearingVotes">
                        {{ isClearingVotes ? 'Clearing votes...' : 'Clear all votes' }}
                    </button>
                </form>

                <p v-if="actionError" class="feedback-error" role="alert">{{ actionError }}</p>
                <p v-else-if="actionMessage" class="feedback-success">{{ actionMessage }}</p>
            </div>
        </AdminCard>

        <AdminCard title="Manage Restaurants">
            <div class="section-heading">
                <div>
                    <p class="eyebrow">Inventory</p>
                    <h2>Restaurant roster</h2>
                </div>
                <NuxtLink to="/api/restaurants" class="quick-link">Open API</NuxtLink>
            </div>

            <p v-if="isLoading" class="muted">Loading restaurants...</p>
            <p v-else-if="loadError" class="muted">{{ loadError }}</p>

            <ul v-else class="restaurant-list">
                <li v-for="restaurant in restaurants" :key="restaurant.id" class="restaurant-row">
                    <span class="badge" :style="{ background: restaurant.color }">{{ restaurant.icon }}</span>
                    <div>
                        <strong>{{ restaurant.name }}</strong>
                        <small>{{ restaurant.cuisine }} • {{ restaurant.orders }} orders • ★ {{ restaurant.rating.toFixed(1) }}</small>
                    </div>
                </li>
            </ul>
        </AdminCard>

        <AdminCard title="Analytics">
            <div class="card-stack">
                <p class="status-copy">Load order trends in a separate page with deferred hydration for the heavier results UI.</p>
                <NuxtLink to="/admin/analytics" class="quick-link">Open analytics page</NuxtLink>
            </div>
        </AdminCard>
    </section>
</template>

