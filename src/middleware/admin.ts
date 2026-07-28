export default defineNuxtRouteMiddleware(() => {
  const authStore = useAuthStore()
  const userStore = useUserStore()

  if (!authStore.token) {
    return navigateTo('/login')
  }

  const isAdmin = Boolean(userStore.user?.admin)

  if (!isAdmin) {
    return navigateTo('/')
  }
})