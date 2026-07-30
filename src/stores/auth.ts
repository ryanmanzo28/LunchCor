import { defineStore } from 'pinia'
import type { User } from '~/types/user'

type AuthProfile = Pick<User, 'name' | 'email' | 'password' | 'admin'> & {
  id: number | null
}

const DEFAULT_JWT_MAX_AGE = 60 * 60 * 24
const REMEMBER_ME_JWT_MAX_AGE = 60 * 60 * 24 * 30

export const useAuthStore = defineStore('auth', () => {
  const token = useCookie<string | null>('jwt', {
    default: () => null,
    sameSite: 'lax',
    path: '/',
    maxAge: DEFAULT_JWT_MAX_AGE,
  })

  const profile = useState<AuthProfile | null>('auth-profile', () => null)

  const currentUser = computed(() => profile.value)
  const userId = computed(() => profile.value?.id ?? null)

  async function setProfile(nextProfile: Partial<AuthProfile> = {}) {
    const resolvedProfile: AuthProfile = {
      id: nextProfile.id ?? profile.value?.id ?? null,
      name: nextProfile.name ?? profile.value?.name ?? '',
      email: nextProfile.email ?? profile.value?.email ?? '',
      password: nextProfile.password ?? profile.value?.password ?? '',
      admin: Boolean(nextProfile.admin ?? profile.value?.admin ?? false),
    }

    profile.value = resolvedProfile

    if (!resolvedProfile.id && resolvedProfile.email && resolvedProfile.password) {
      try {
        const response = await $fetch<{ user?: { id: number, name: string, email: string, admin: boolean } }>('/api/auth/login', {
          method: 'POST',
          body: {
            email: resolvedProfile.email,
            password: resolvedProfile.password,
          },
        })

        const loggedInUser = response.user
        if (loggedInUser) {
          profile.value = {
            id: loggedInUser.id,
            name: loggedInUser.name,
            email: loggedInUser.email,
            password: resolvedProfile.password,
            admin: Boolean(loggedInUser.admin),
          }
        }
      } catch {
        profile.value = resolvedProfile
      }
    }

    return profile.value
  }

  function setToken(nextToken: string, rememberMe = false) {
    const maxAge = rememberMe ? REMEMBER_ME_JWT_MAX_AGE : DEFAULT_JWT_MAX_AGE
    const jwtCookie = useCookie<string | null>('jwt', {
      default: () => token.value ?? null,
      sameSite: 'lax',
      path: '/',
      maxAge,
    })

    jwtCookie.value = nextToken
    token.value = nextToken
  }

  function clearToken() {
    const jwtCookie = useCookie<string | null>('jwt', {
      default: () => null,
      sameSite: 'lax',
      path: '/',
      maxAge: 0,
    })

    jwtCookie.value = null
    token.value = null
    profile.value = null
  }

  return {
    token,
    profile: currentUser,
    userId,
    setProfile,
    setToken,
    clearToken,
  }
})