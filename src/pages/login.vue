<template>
  <main class="login-page">
    <section class="login-card">
      <NuxtLink class="brand" to="/">Lunch<span>Cor</span></NuxtLink>
      <p class="eyebrow">Welcome back</p>
      <h1>Lunch decisions, made easy.</h1>
      <p class="login-copy">See what the team wants, cast your vote, and keep track of the places everyone loves.</p>
      <form @submit.prevent="signIn">
        <label for="email">Work email</label>
        <input id="email" v-model="email" type="email" autocomplete="email" placeholder="you@company.com" required>
        <button type="submit">Continue to LunchCor <span aria-hidden="true">→</span></button>
      </form>
      <p class="form-note">Demo mode — any email will work.</p>
    </section>
  </main>
</template>

<script setup lang="ts">
useHead({
  title: 'Login',
  link: [
    { rel: 'icon', href: '/favicon.ico' },
  ],
})
const router = useRouter()
const authStore = useAuthStore()
const userStore = useUserStore()
const email = ref('')

function signIn() {
  const name = email.value
    .split('@')[0]
    .replace(/[._-]/g, ' ')
    .replace(/\b\w/g, (letter) => letter.toUpperCase()) || 'LunchCor User'

  authStore.setToken('demo-jwt')
  userStore.setUser({ id: 1, name, email: email.value })
  router.push('/')
}
</script>