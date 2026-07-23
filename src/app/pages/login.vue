<template>
  <main class="page">
    <section class="card">
      <h1>Login</h1>
      <p>This placeholder page keeps the Pinia auth flow reachable.</p>
      <button type="button" @click="signIn">Sign in</button>
    </section>
  </main>
</template>

<script setup lang="ts">
const router = useRouter()
const authStore = useAuthStore()
const userStore = useUserStore()

function signIn() {
  const token = 'demo-jwt'
  localStorage.setItem('jwt', token)
  authStore.setToken(token)
  userStore.fetchUser()
  router.push('/')
}
</script>