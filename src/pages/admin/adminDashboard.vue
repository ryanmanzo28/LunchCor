<script setup lang="ts">
definePageMeta({
    layout: 'admin',
    middleware: ['admin'],
})

useHead({
    title: 'Admin Dashboard',
    link: [{ rel: 'icon', href: '/favicon.ico' }],
})

const restaurantsStore = useRestaurantsStore()
const { restaurants, isLoading, loadError } = storeToRefs(restaurantsStore)

// Prime admin dashboard with restaurant inventory on first client render.
if (import.meta.client) {
    void restaurantsStore.fetchRestaurants()
}
</script>

<style scoped>
.admin-grid {
    display: grid;
    gap: 14px;
}

.muted {
    margin: 0;
    color: #566579;
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
</style>
<template>
    <section class="admin-grid">
        <AdminCard title="Manage Restaurants">
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
    </section>
</template>

