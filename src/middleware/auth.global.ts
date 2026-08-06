import { resolveAuthGuardState } from '@/utils/auth-guard'

export default defineNuxtRouteMiddleware(async (to) => {
  const authStore = useAuthStore()
  const userStore = useUserStore()

  if (authStore.token && !authStore.profile) {
    await authStore.restoreSession()
  }

  const guard = resolveAuthGuardState({
    path: to.path,
    token: authStore.token,
    profile: authStore.profile,
  })

  if (guard.shouldRedirectToLogin) {
    return navigateTo('/login')
  }

  if (guard.shouldRedirectToHome) {
    return navigateTo('/')
  }

  userStore.setUser(authStore.profile ? {
    id: authStore.profile.id ?? 0,
    name: authStore.profile.name,
    email: authStore.profile.email,
    password: authStore.profile.password,
    admin: authStore.profile.admin,
  } : null)
})
  