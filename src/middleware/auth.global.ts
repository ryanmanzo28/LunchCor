export default defineNuxtRouteMiddleware(async (to) => {
  const authStore = useAuthStore()
  const userStore = useUserStore()
  const normalizedPath = to.path.replace(/\/+$/, '') || '/'
  const publicAuthPages = ['/login', '/register']

  if (authStore.token && !authStore.profile) {
    await authStore.restoreSession()
  }

  const authenticated = Boolean(authStore.token)

  if (!authenticated && !publicAuthPages.includes(normalizedPath)) {
    return navigateTo('/login')
  }

  if (authenticated && normalizedPath === '/login') {
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
  