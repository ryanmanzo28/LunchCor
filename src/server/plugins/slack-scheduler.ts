import { sendSlackMessages } from '~/server/services/slack'

export default defineNitroPlugin((nitroApp) => {
  void sendSlackMessages()

  const interval = setInterval(() => {
    void sendSlackMessages()
  }, 5 * 60 * 1000)

  nitroApp.hooks.hookOnce('close', () => {
    clearInterval(interval)
  })
})