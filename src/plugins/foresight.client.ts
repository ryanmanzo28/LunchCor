import { ForesightManager } from 'js.foresight'
// Track anchors once to avoid duplicate registrations after DOM mutations.
const trackedAnchors = new WeakSet<HTMLAnchorElement>()

function isLocalAnchor(anchor: HTMLAnchorElement) {
  const href = anchor.getAttribute('href')

  if (!href || href.startsWith('#') || href.startsWith('mailto:') || href.startsWith('tel:')) {
    return false
  }

  if (anchor.hasAttribute('download') || anchor.target === '_blank') {
    return false
  }

  try {
    const url = new URL(href, window.location.href)
    return url.origin === window.location.origin
  } catch {
    return false
  }
}

export default defineNuxtPlugin((nuxtApp) => {
  if (import.meta.server) {
    return
  }

  const prefetched = new Set<string>()
  const router = useRouter()
  // Nuxt may expose payload preloading globally depending on runtime mode.
  const preloadRoutePayloadFn = (globalThis as typeof globalThis & {
    preloadRoutePayload?: (path: string) => Promise<void>
  }).preloadRoutePayload

  try {
    const manager = ForesightManager.initialize({
      enableManagerLogging: false,
      enableMousePrediction: true,
      enableTabPrediction: true,
      enableScrollPrediction: true,
    })

    nuxtApp.provide('foresight', manager)

    Object.defineProperty(window, '$foresight', {
      configurable: true,
      enumerable: false,
      writable: false,
      value: manager,
    })

    const registerAnchors = () => {
      if (!document.body) {
        return
      }

      Array.from(document.querySelectorAll<HTMLAnchorElement>('a[href]')).forEach((anchor) => {
        if (trackedAnchors.has(anchor) || !isLocalAnchor(anchor)) {
          return
        }

        trackedAnchors.add(anchor)

        // Predictive prefetch: warm route code and payload before click.
        manager.register({
          element: anchor,
          name: `nav-${anchor.href}`,
          enabled: true,
          hitSlop: 12,
          callback: async () => {
            const href = anchor.getAttribute('href')

            if (!href || prefetched.has(href)) {
              return
            }

            prefetched.add(href)

            try {
              const resolved = router.resolve(href)
              if (resolved.matched.length > 0) {
                await preloadRouteComponents(href)
                await preloadRoutePayloadFn?.(href)
              }
            } catch (error) {
              prefetched.delete(href)
              console.debug('Foresight prefetch failed', href, error)
            }
          },
        })
      })
    }

    registerAnchors()

    // Re-scan links when client-rendered content adds new anchors.
    const observer = new MutationObserver(() => {
      registerAnchors()
    })

    observer.observe(document.body, {
      childList: true,
      subtree: true,
    })
  }
  catch (error) {
    console.warn('Foresight initialization failed:', error)
  }
})