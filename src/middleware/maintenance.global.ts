export default defineNuxtRouteMiddleware(async (to) => {
  const now = new Date()

  const isWednesday = now.getDay() === 3
  const hour = now.getHours()
  const isLunchWindow = isWednesday && hour >= 11 && hour < 17
  const isVoteClear = isWednesday && hour >= 17

  const authStore = useAuthStore()
  const isAdmin = Boolean(authStore.profile?.admin)
  const clearKey = `${now.getFullYear()}-${now.getMonth() + 1}-${now.getDate()}`
  const processState = globalThis as typeof globalThis & { __maintenanceLastVoteClearKey?: string }

  if (
    import.meta.server
    && isVoteClear
    && processState.__maintenanceLastVoteClearKey !== clearKey
  ) {
    try {
      await $fetch('/api/admin/votes/votes', {
        method: 'DELETE',
        headers: useRequestHeaders(['cookie']),
      })

      processState.__maintenanceLastVoteClearKey = clearKey
    }
    catch {
      // Skip throwing inside global middleware; retry on next navigation.
    }
  }

  const winnerRoute = '/winningRestaurant'

  if ((isLunchWindow || isAdmin) && to.path !== winnerRoute) {
    return navigateTo(winnerRoute, { replace: true })
  }
})