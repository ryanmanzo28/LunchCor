<template>
  <main class="login-page">
    <section class="login-card">
      <NuxtLink class="brand" to="/">Lunch<span>Cor</span></NuxtLink>
      <p class="eyebrow">Welcome back</p>
      <h1>Lunch decisions, made easy.</h1>
      <p class="login-copy">See what the team wants, cast your vote, and keep track of the places everyone loves.</p>
      <form @submit.prevent="signIn">
        <label for="email">Work email</label>
        <input id="email" v-model="email" type="email" autocomplete="email" placeholder="you@company.com" :disabled="isSubmitting" required>
        <label for="password">Password</label>
        <input id="password" v-model="password" type="password" autocomplete="current-password" placeholder="Enter your password" :disabled="isSubmitting" required>
        <p v-if="loginError" class="login-error" role="alert">{{ loginError }}</p>
        <button type="submit" :disabled="isSubmitting">
          {{ isSubmitting ? 'Signing in...' : 'Continue to LunchCor' }} <span aria-hidden="true">→</span>
        </button>
        <button type="button" :disabled="isSubmitting" @click="navigateTo('/register')">Register</button>
      </form>
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
const email = ref('')
const password = ref('')
const isSubmitting = ref(false)
const loginError = ref('')

async function signIn() {
  if (isSubmitting.value) {
    return
  }

  loginError.value = ''
  isSubmitting.value = true

  try {
    await authStore.login(email.value, password.value)

    await router.replace('/')
  } catch {
    loginError.value = 'Invalid email or password. Please try again.'
  } finally {
    isSubmitting.value = false
  }
}
</script>

<style scoped>
.login-error {
  margin: 0.5rem 0;
  color: #b42318;
}
</style>
