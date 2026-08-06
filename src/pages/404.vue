<script setup lang="ts">

useHead({
  title: 'Page not found · LunchCor',
})
</script>

<template>
  <div class="not-found-shell">
    <div class="not-found-card">
      <p class="eyebrow">404</p>
      <h1>We lost this page.</h1>
      <p>That route doesn’t exist yet, so head back to the lunch board and keep moving.</p>
      <NuxtLink to="/" class="back-link">Back home</NuxtLink>
    </div>
  </div>
</template>

<style scoped>
.not-found-shell {
  min-height: 100vh;
  display: grid;
  place-items: center;
  padding: 24px;
  background: linear-gradient(135deg, #fff7ed 0%, #f8fafc 100%);
}

.not-found-card {
  max-width: 520px;
  width: 100%;
  padding: 28px;
  border-radius: 24px;
  background: white;
  box-shadow: 0 18px 40px rgba(15, 23, 42, 0.08);
  text-align: center;
}

.eyebrow {
  margin: 0 0 8px;
  text-transform: uppercase;
  letter-spacing: 0.22em;
  font-size: 0.78rem;
  font-weight: 700;
  color: #b45309;
}

h1 {
  margin: 0;
  font-size: 2rem;
  color: #172033;
}

p {
  margin: 10px 0 0;
  color: #475569;
}

.back-link {
  display: inline-block;
  margin-top: 18px;
  padding: 10px 14px;
  border-radius: 999px;
  background: #2563eb;
  color: white;
  font-weight: 700;
  text-decoration: none;
}
</style>
