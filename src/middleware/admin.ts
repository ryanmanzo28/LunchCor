export default defineNuxtRouteMiddleware(() => {
  const authStore = useAuthStore()
  const userStore = useUserStore()

  if (!authStore.token) {
    return navigateTo('/login')
  }

  const isAdmin = Boolean(userStore.user?.admin)

  // Gate admin routes to users explicitly marked as admin.
  if (!isAdmin) {
    return navigateTo('/')
  }
})