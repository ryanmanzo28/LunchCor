export default defineNuxtPlugin((nuxtApp) => {
  nuxtApp.hook('page:finish', () => {
    if (!import.meta.client || document.readyState !== 'complete') {
      return
    }

    const route = nuxtApp.$router.currentRoute.value
    const rawPath = route.path === '/' ? 'home' : route.path.replace(/^\//, '').replace(/\//g, ' ')
    const pageName = rawPath || 'page'

    console.log(`${pageName} loaded`)
  })
})
