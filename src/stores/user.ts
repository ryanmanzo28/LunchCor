import { defineStore } from 'pinia'

type User = {
  id: number
  name: string
  email: string
}

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

  return {
    user,
    fetchUser,
    clearUser,
  }
})