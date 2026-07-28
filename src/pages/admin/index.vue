<template>
  <section class="admin-grid">
    <article class="card">
      <h2>System Status</h2>
      <p>Frontend and API are reachable through the Nuxt app runtime.</p>
    </article>

    <article class="card">
      <h2>Restaurants</h2>
      <p>Use the restaurants API endpoint to list, add, and remove entries.</p>
      <NuxtLink to="/api/health/restaurants">Open endpoint</NuxtLink>
    </article>

    <article class="card">
      <h2>Next Step</h2>
      <p>Add role-based access when user roles are available in auth state.</p>
    </article>
  </section>
</template>

<script setup lang="ts">
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