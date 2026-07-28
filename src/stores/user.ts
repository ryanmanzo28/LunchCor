import { defineStore } from 'pinia'
import type { User } from '@/types/user'
import { decodeId } from '@/utils/jwtVerify'


export const useUserStore = defineStore('user', () => {
  const user = useState<User | null>('auth-user', () => null)

  async function fetchUser() {
    const authStore = useAuthStore()
    const token = authStore.token

    if (!token) {
      user.value = null
      return null
    }

    try {
      const id = await decodeId(token)
      if (id) {
        const response = await $fetch<User>(`/api/users/${id}`, {
        })
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