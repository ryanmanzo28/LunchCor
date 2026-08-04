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

function makeAsyncDataKey(request: string) {
  return `api:${request}:${Date.now()}:${Math.random().toString(36).slice(2)}`
}

export async function useAPIData<T>(request: string, options: ApiFetchOptions = {}) {
  const runtimeConfig = useRuntimeConfig()

  const { data, error } = await useAsyncData<T>(
    makeAsyncDataKey(request),
    () => $fetch<T>(request, {
      baseURL: runtimeConfig.public.apiBase,
      ...withProjectAuth(options),
    }),
  )

  if (error.value) {
    if ((error.value as { statusCode?: number }).statusCode === 401) {
      await navigateTo('/login')
    }

    throw error.value
  }

  return data.value as T
}
