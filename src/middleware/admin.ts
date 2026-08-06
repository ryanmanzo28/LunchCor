import { resolveAuthGuardState } from '@/utils/auth-guard'

export default defineNuxtRouteMiddleware(() => {
  const authStore = useAuthStore()
  const guard = resolveAuthGuardState({
    path: '/admin',
    token: authStore.token,
    profile: authStore.profile,
  })

  if (guard.shouldRedirectToLogin) {
    return navigateTo('/login')
  }

  if (!guard.isAdminAccessAllowed) {
    return navigateTo('/')
  }
})