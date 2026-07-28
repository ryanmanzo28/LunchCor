import { defineStore } from 'pinia'

export const useAuthStore = defineStore('auth', () => {
  const token = useCookie<string | null>('jwt', {
    default: () => null,
    sameSite: 'lax',
    path: '/',
  })

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