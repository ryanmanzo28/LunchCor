export default defineNuxtRouteMiddleware((to) => {
  const now = new Date()

  const isWednesday = now.getDay() === 3
  const hour = now.getHours()
  const isLunchWindow = isWednesday && hour >= 11 && hour < 17

  const authStore = useAuthStore()
  const isAdmin = Boolean(authStore.profile?.admin)

  const winnerRoute = '/winningRestaurant'

  if ((isLunchWindow || isAdmin) && to.path !== winnerRoute) {
    return navigateTo(winnerRoute, { replace: true })
  }
})