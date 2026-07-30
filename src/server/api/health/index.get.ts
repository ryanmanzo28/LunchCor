export default defineEventHandler(() => {
  // Lightweight liveness endpoint for deployment and container checks.
  return {
    status: 'ok',
    service: 'lunchcor-nuxt',
    mode: 'skeleton',
  }
})
