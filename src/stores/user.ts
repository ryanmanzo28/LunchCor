import { defineStore } from 'pinia'
import type { User } from '@/types/user'

export const useUserStore = defineStore('user', () => {
  const user = useState<User | null>('auth-user', () => null)

  async function fetchUser() {
    const authStore = useAuthStore()
    const token = authStore.token

    if (!token) {
      user.value = null
      return null
    }

    user.value = {
      id: 1,
      name: 'LunchCor User',
      email: 'user@lunchcor.local',
      admin: false,
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