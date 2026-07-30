export default defineNuxtRouteMiddleware(async (to) => {
  const authStore = useAuthStore()
  const userStore = useUserStore()

  if (authStore.token && !authStore.profile) {
    await authStore.restoreSession()
  }

  const authenticated = Boolean(authStore.token)

  if (!authenticated && to.path !== '/login') {
    return navigateTo('/login')
  }

  if (authenticated && to.path === '/login') {
    return navigateTo('/')
  }

  userStore.setUser(authStore.profile ? {
    id: authStore.profile.id ?? 0,
    name: authStore.profile.name,
    email: authStore.profile.email,
    password: authStore.profile.password,
    admin: authStore.profile.admin,
  } : null)
})
  