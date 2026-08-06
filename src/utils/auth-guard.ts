export interface AuthGuardState {
  authenticated: boolean
  shouldRedirectToLogin: boolean
  shouldRedirectToHome: boolean
  isAdminAccessAllowed: boolean
}

export interface AuthGuardInput {
  path: string
  token: string | null | undefined
  profile: { admin?: boolean | null } | null | undefined
}

export function resolveAuthGuardState(input: AuthGuardInput): AuthGuardState {
  const normalizedPath = input.path.replace(/\/+$/, '') || '/'
  const publicAuthPages = ['/login', '/register']
  const authenticated = Boolean(input.token)
  const isAdmin = Boolean(input.profile?.admin)

  return {
    authenticated,
    shouldRedirectToLogin: !authenticated && !publicAuthPages.includes(normalizedPath),
    shouldRedirectToHome: authenticated && normalizedPath === '/login',
    isAdminAccessAllowed: authenticated && isAdmin,
  }
}
