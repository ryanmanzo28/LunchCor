import { defineStore } from 'pinia'
import type { User } from '@/types/user'

export const useUserStore = defineStore('user', () => {
  const user = useState<User | null>('auth-user', () => null)

  async function fetchUser() {
    if (!process.client) {
      return user.value
    }

    const token = localStorage.getItem('jwt')

    if (!token) {
      user.value = null
      return null
    }

    user.value = {
      id: 1,
      name: 'LunchCor User',
      email: 'user@lunchcor.local',
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