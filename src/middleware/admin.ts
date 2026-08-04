export default defineNuxtRouteMiddleware(() => {
  const authStore = useAuthStore()

  if (!authStore.token) {
    return navigateTo('/login')
  }

  const isAdmin = Boolean(authStore.profile?.admin)

  // Gate admin routes to users explicitly marked as admin.
  if (!isAdmin) {
    return navigateTo('/')
  }
})