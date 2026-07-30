import { CantinaWebhook } from '~/server/utils/slack'

export default defineEventHandler(async (event) => {
  const body = await readBody<{ text: string }>(event)

  const slack = new CantinaWebhook()

  await slack.send({
    text: body.text,
  })

  return {
    success: true,
  }
})