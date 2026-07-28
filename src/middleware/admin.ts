export default defineNuxtRouteMiddleware(() => {
  const authStore = useAuthStore()
  const userStore = useUserStore()

  if (!authStore.token) {
    return navigateTo('/login')
  }

  const email = userStore.user?.email?.toLowerCase() ?? ''
  const isAdmin = email === 'admin@lunchcor.local' || /^admin\+.+@lunchcor\.local$/.test(email)

  if (!isAdmin) {
    return navigateTo('/')
  }
})