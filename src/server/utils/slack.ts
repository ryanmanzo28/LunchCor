export interface SlackMessage {
  text: string
}

export interface SlackSender {
  type: 'channel' | 'dm'
  send(message: SlackMessage): Promise<void>
}

export class CantinaWebhook implements SlackSender {
  readonly type = 'channel' as const

  async send(message: SlackMessage) {
    await $fetch(process.env.SLACK_WEBHOOK_URL!, {
      method: 'POST',
      body: {
        text: message.text,
      },
    })
  }
}