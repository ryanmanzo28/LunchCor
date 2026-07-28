export default defineNuxtRouteMiddleware(() => {
  const authStore = useAuthStore()
  const userStore = useUserStore()

  if (!authStore.token) {
    return navigateTo('/login')
  }

  const email = userStore.user?.email?.toLowerCase() ?? ''
  const isAdmin = email.includes('admin') || email.endsWith('@lunchcor.local')

  if (!isAdmin) {
    return navigateTo('/')
  }
})