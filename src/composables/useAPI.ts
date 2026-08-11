type ApiFetchOptions = NonNullable<Parameters<typeof $fetch>[1]>

interface UseAPIOptions {
  fetch?: ApiFetchOptions
  key?: string
  server?: boolean
  immediate?: boolean
}

export async function useLazyAPIData<T>(
  request: string,
  options: UseAPIOptions = {},
){
  const {
    public: { apiBase },
  } = useRuntimeConfig()

  const authStore = useAuthStore()
  const headers = new Headers(options.fetch?.headers)

  if (authStore.token && !headers.has('Authorization')) {
    headers.set('Authorization', `Bearer ${authStore.token}`)
  }

  const fetchOptions: ApiFetchOptions = {
    credentials: 'include',
    ...options.fetch,
    headers,
  }

  const execute = () =>
    $fetch(request, {
      baseURL: apiBase,
      ...fetchOptions,
    }) as Promise<T>

  const method = String(fetchOptions.method ?? 'GET').toUpperCase()

  const key =
    options.key ??
    JSON.stringify({
      method,
      request,
      query: fetchOptions.query,
      params: fetchOptions.params,
      body: method === 'GET' ? undefined : fetchOptions.body,
    })

  const asyncData = await useLazyAsyncData<T>(
    key,
    execute,
    {
      server: options.server ?? true,
      immediate: options.immediate ?? true,
      dedupe: 'defer',
      deep: false,
    },
  )

  if (asyncData.error.value?.statusCode === 401) {
    authStore.clearToken()

    if (import.meta.client) {
      await navigateTo('/login')
    }
  }

  return asyncData
}