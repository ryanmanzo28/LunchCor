<template>
  <section class="admin-grid">
    <AdminCard title="System Status">
      <p>Frontend and API are reachable through the Nuxt app runtime.</p>
    </AdminCard>

    <AdminCard title="Operations">
      <p>Inspect restaurant inventory, manually clear votes, and keep the lunch round moving.</p>
      <NuxtLink to="/admin/adminDashboard">Open operations dashboard</NuxtLink>
    </AdminCard>

    <AdminCard title="Analytics">
      <p>Review order demand by restaurant and meal with a lightweight reporting view.</p>
      <NuxtLink to="/admin/analytics">Open analytics</NuxtLink>
    </AdminCard>
  </section>
</template>

<script setup lang="ts">
// Reuse the dedicated admin shell for navigation and framing.
definePageMeta({
  layout: 'admin',
})
</script>

<style scoped>
.admin-grid {
  display: grid;
  gap: 14px;
  grid-template-columns: repeat(3, minmax(0, 1fr));
}

.card {
  border: 1px solid #e4e8ef;
  border-radius: 10px;
  padding: 16px;
}

.card h2 {
  margin: 0 0 10px;
  font-size: 1.05rem;
  color: #1f3249;
}

.card p {
  margin: 0;
  color: #566579;
  line-height: 1.5;
}

.card a {
  display: inline-block;
  margin-top: 10px;
  color: #225ea8;
  text-decoration: none;
  font-weight: 600;
}

@media (max-width: 900px) {
  .admin-grid {
    grid-template-columns: 1fr;
  }
}
</style>