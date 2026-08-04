import { defineStore } from 'pinia'
import type { User } from '@/types/user'
import { decodeId } from '@/utils/jwtVerify'


export const useUserStore = defineStore('user', () => {
  const user = useState<User | null>('auth-user', () => null)
  const profileImage = useState<string | null>('auth-user-profile-image', () => null)

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
        const response = await apiFetch<User>(`/users/${id}`)
        user.value = response
      } else {
        user.value = null
      }
    } catch (error) {
      user.value = null
    }

    return user.value
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
    avatar,
    fetchUser,
    clearUser,
    setUser,
    setProfileImage,
    clearProfileImage,
  }
})