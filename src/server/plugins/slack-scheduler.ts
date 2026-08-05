import { sendSlackMessages } from '~/server/services/slack'

export default defineNitroPlugin((nitroApp) => {
  if (import.meta.prerender) {
    return
  }

  void sendSlackMessages()

  const interval = setInterval(() => {
    void sendSlackMessages()
  }, 5 * 60 * 1000)

  nitroApp.hooks.hookOnce('close', () => {
    clearInterval(interval)
  })
})