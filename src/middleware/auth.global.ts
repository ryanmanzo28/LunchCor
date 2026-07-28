export default defineNuxtRouteMiddleware(async (to) => {
  const isLoginRoute = to.path === '/login'
  const authStore = useAuthStore()
  const userStore = useUserStore()

  const currentToken = authStore.token?.trim() || null

  if (!currentToken) {
    authStore.clearToken()
    userStore.clearUser()

    if (!isLoginRoute) {
      return navigateTo({
        path: '/login',
        query: { redirect: to.fullPath },
      })
    }

    return
  }

  if (isLoginRoute) {
    return navigateTo('/')
  }

  try {
    if (!userStore.user) {
      await userStore.fetchUser()
    }

    if (!userStore.user) {
      throw new Error('Unable to hydrate user from token')
    }
  }
  catch {
    authStore.clearToken()
    userStore.clearUser()

    return navigateTo({
      path: '/login',
      query: { redirect: to.fullPath },
    })
  }
})