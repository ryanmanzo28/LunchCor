type ApiFetchOptions = NonNullable<Parameters<typeof $fetch>[1]>

interface AuthUserResponse {
  id: number
  name: string
  email: string
  admin: boolean
}

interface RestaurantSummary {
  id: number
  name: string
  cuisine: string
  description: string
  rating: number
  orders: number
  timesVoted: number
  votes: number
  icon: string
  color: string
  link?: string
}

type ApiEndpointMap = {
  '/auth/login': { token?: string, user?: AuthUserResponse }
  '/auth/restore-session': { user?: AuthUserResponse }
  '/auth/logout': { success: boolean }
  '/restaurants': { status: string, count: number, restaurants: RestaurantSummary[] }
  '/votes/vote': { success: boolean }
  '/restaurants/create': { status: 'created', restaurant: RestaurantSummary }
  [key: `/restaurants/${number}/menu`]: {
    restaurantId: number
    restaurantName: string
    menuItems: Array<{
      section?: string
      name: string
      description?: string
      price?: string
    }>
  }
  '/users/create': { id: number, name: string, email: string, admin: boolean }
  [key: `/users/search?q=${string}`]: Array<{ id: number, name: string, email: string, admin: boolean }>
  [key: `/users/${number}`]: {
    id: number
    name: string
    email: string
    password: string
    admin: boolean
  }
}

type ApiEndpoint = keyof ApiEndpointMap

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

export async function useAPIData<P extends ApiEndpoint>(request: P, options?: ApiFetchOptions): Promise<ApiEndpointMap[P]>
export async function useAPIData<T>(request: string, options?: ApiFetchOptions): Promise<T>
export async function useAPIData<T>(request: string, options: ApiFetchOptions = {}) {
  const runtimeConfig = useRuntimeConfig()

  const { data, error } = await useAsyncData<T>(
    makeAsyncDataKey(request),
    () => (
      $fetch(request, {
        baseURL: runtimeConfig.public.apiBase,
        ...withProjectAuth(options),
      }) as Promise<T>
    ),
  )

  if (error.value) {
    if ((error.value as { statusCode?: number }).statusCode === 401) {
      await navigateTo('/login')
    }

    throw error.value
  }

  return data.value as T
}
