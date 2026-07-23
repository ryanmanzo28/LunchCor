export default defineNuxtRouteMiddleware(async (to) => {
  if (to.path === '/login') {
    return
  }

  const token = localStorage.getItem('jwt')

  if (!token) {
    return navigateTo('/login')
  }

  const authStore = useAuthStore()
  authStore.setToken(token)

  const userStore = useUserStore()

  if (!userStore.user) {
    await userStore.fetchUser()
  }
})