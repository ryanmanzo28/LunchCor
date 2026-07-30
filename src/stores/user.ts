import { defineStore } from 'pinia'
import type { User } from '@/types/user'
import { decodeId } from '@/utils/jwtVerify'


export const useUserStore = defineStore('user', () => {
  const user = useState<User | null>('auth-user', () => null)

  async function fetchUser() {
    const authStore = useAuthStore()
    const token = authStore.token || null

    if (!token) {
      user.value = null
      return null
    }

    try {
      // Prefer cached id from auth store and fall back to JWT payload decode.
      const id = authStore.userId ?? await decodeId(token)
      if (id) {
        const response = await $fetch<User>(`/api/users/${id}`, {})
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
  }

  function setUser(nextUser: User | null) {
    user.value = nextUser
  }

  return {
    user,
    fetchUser,
    clearUser,
    setUser,
  }
})