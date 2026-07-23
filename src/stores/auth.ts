import { defineStore } from 'pinia'

export const useAuthStore = defineStore('auth', () => {
  const token = useState<string | null>('auth-token', () => null)

  function setToken(nextToken: string) {
    token.value = nextToken
  }

  function clearToken() {
    token.value = null
  }

  return {
    token,
    setToken,
    clearToken,
  }
})