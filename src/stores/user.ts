import { defineStore } from 'pinia'
import type { User } from '@/types/user'
import { decodeId } from '@/utils/jwtVerify'
import { useLazyAPIData } from '@/composables/useAPI'

interface CreateUserInput {
  name: string
  email: string
  password: string
}

interface UserSummary {
  id: number
  name: string
  email: string
  admin: boolean
}


export const useUserStore = defineStore('user', () => {
  const user = useState<User | null>('auth-user', () => null)
  const profileImage = useState<string | null>('auth-user-profile-image', () => null)
  const searchResults = useState<UserSummary[]>('user-search-results', () => [])
  const isSearching = useState<boolean>('user-searching', () => false)

  const avatar = computed(() => {
    if (profileImage.value) {
      return profileImage.value
    }

    const initials = (user.value?.name ?? 'Guest')
      .split(' ')
      .map((n) => n[0])
      .join('')
      .slice(0, 2)
      .toUpperCase()

    return `data:image/svg+xml;utf8,${encodeURIComponent(`
      <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100">
        <circle cx="50" cy="50" r="50" fill="#4285f4"/>
        <text x="50%" y="50%"
          dominant-baseline="middle"
          text-anchor="middle"
          fill="white"
          font-size="40"
          font-family="Arial">
          ${initials}
        </text>
      </svg>
    `)}`
  })

  async function fetchUser() {
    const authStore = useAuthStore()
    const token = authStore.token || null

    if (authStore.profile?.id) {
      user.value = {
        id: authStore.profile.id,
        name: authStore.profile.name,
        email: authStore.profile.email,
        password: '',
        admin: Boolean(authStore.profile.admin),
      }

      return user.value
    }

    if (!token) {
      user.value = null
      return null
    }

    try {
      // Prefer cached id from auth store and fall back to JWT payload decode.
      const id = authStore.userId ?? await decodeId(token)
      if (id) {
        const { data } = await useLazyAPIData<User>(`/users/${id}`)
        const response = data.value
        if (!response) {
          throw createError({
            statusCode: 500,
            statusMessage: 'Empty user response',
          })
        }
        user.value = response
      } else {
        user.value = null
      }
    } catch (error) {
      user.value = null
    }

    return user.value
  }

  async function createUser(input: CreateUserInput) {
    const { data } = await useLazyAPIData<UserSummary>('/users/create', {
      fetch: {
        method: 'POST',
        body: {
          name: input.name.trim(),
          email: input.email.trim().toLowerCase(),
          password: input.password,
        },
      },
    })
    const created = data.value

    if (!created) {
      throw createError({
        statusCode: 500,
        statusMessage: 'Empty create-user response',
      })
    }

    return created
  }

  async function searchUsers(query: string) {
    const normalized = query.trim()

    if (!normalized) {
      searchResults.value = []
      return searchResults.value
    }

    isSearching.value = true

    try {
      const { data } = await useLazyAPIData<UserSummary[]>(`/users/search?q=${encodeURIComponent(normalized)}`, {
        fetch: {
          method: 'GET',
        },
      })
      const results = data.value

      if (!results) {
        throw createError({
          statusCode: 500,
          statusMessage: 'Empty search response',
        })
      }

      searchResults.value = results
      return results
    } finally {
      isSearching.value = false
    }
  }

  function clearUser() {
    user.value = null
    profileImage.value = null
  }

  function setUser(nextUser: User | null) {
    user.value = nextUser
  }

  function setProfileImage(nextImage: string | null) {
    profileImage.value = nextImage?.trim() || null
  }

  function clearProfileImage() {
    profileImage.value = null
  }

  return {
    user,
    profileImage,
    searchResults,
    isSearching,
    avatar,
    fetchUser,
    createUser,
    searchUsers,
    clearUser,
    setUser,
    setProfileImage,
    clearProfileImage,
  }
})