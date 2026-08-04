type ApiFetchOptions = NonNullable<Parameters<typeof $fetch>[1]>

function withProjectAuth(options: ApiFetchOptions = {}) {
  const authStore = useAuthStore()
  const token = authStore.token
  const headers = new Headers(options.headers ?? {})

  if (token && !headers.has('Authorization')) {
    headers.set('Authorization', `Bearer ${token}`)
  }

  return {
    ...options,
    headers,
    credentials: options.credentials ?? 'include',
  } satisfies ApiFetchOptions
}

export async function apiFetch<T>(request: string, options: ApiFetchOptions = {}) {
  const runtimeConfig = useRuntimeConfig()
  return await $fetch<T>(request, {
    baseURL: runtimeConfig.public.apiBase,
    ...withProjectAuth(options),
  })
}

export const useAPI = createUseFetch({
  baseURL: () => useRuntimeConfig().public.apiBase,
  onRequest({ options }) {
    const next = withProjectAuth(options as ApiFetchOptions)
    options.headers = next.headers
    options.credentials = next.credentials
  },
  async onResponseError({ response }) {
    if (response.status === 401) {
      await navigateTo('/login')
    }
  },
})
