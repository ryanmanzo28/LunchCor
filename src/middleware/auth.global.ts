export default defineNuxtRouteMiddleware(async (to) => {
  if (!import.meta.client) {
    return
  }

  const isLoginRoute = to.path === '/login'
  const authStore = useAuthStore()
  const userStore = useUserStore()

  let token = authStore.token?.trim() || null

  try {
    const persisted = localStorage.getItem('jwt')?.trim() || null

    if (persisted) {
      token = persisted
    }
  }
  catch {
    // localStorage can fail in restricted browser contexts; fall back to store state.
  }

  if (!token) {
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

  if (token !== authStore.token) {
    authStore.setToken(token)
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

    try {
      localStorage.removeItem('jwt')
    }
    catch {
      // Ignore storage cleanup failures.
    }

    return navigateTo({
      path: '/login',
      query: { redirect: to.fullPath },
    })
  }
})