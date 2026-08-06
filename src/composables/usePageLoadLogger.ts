export function usePageLoadLogger(pageName: string) {
  const logLoaded = () => {
    if (import.meta.client && document.readyState === 'complete') {
      console.log(`${pageName} loaded`)
    }
  }

  onMounted(() => {
    logLoaded()
  })

  return {
    logLoaded,
  }
}
