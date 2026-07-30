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
        <label for="password">Password</label>
        <input id="password" v-model="password" type="password" autocomplete="current-password" placeholder="Enter your password" required>
        <button type="submit">Continue to LunchCor <span aria-hidden="true">→</span></button>
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
const userStore = useUserStore()
const email = ref('')
const password = ref('')

async function signIn() {
  const normalizedEmail = email.value.trim().toLowerCase()
  const localPart = normalizedEmail.split('@')[0] ?? ''
  const nextPassword = password.value
  const name = localPart
    .replace(/[._-]/g, ' ')
    .replace(/\b\w/g, (letter) => letter.toUpperCase()) || 'LunchCor User'
  const isAdmin = normalizedEmail === 'admin@lunchcor.local' || /^admin\+.+@lunchcor\.local$/.test(normalizedEmail)

  await authStore.setProfile({
    name,
    email: normalizedEmail,
    password: nextPassword,
    admin: isAdmin,
  })

  authStore.setToken('jwt')

  userStore.setUser({
    id: authStore.userId ?? 0,
    name,
    email: normalizedEmail,
    password: nextPassword,
    admin: isAdmin,
  })

  await router.push('/')
}
</script>
