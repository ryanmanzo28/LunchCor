import mysql from 'mysql2/promise'
import { getPool } from '~/server/utils/db'

type SlackSlot = 1 | 2 | 3

interface SlackLastSentRow extends mysql.RowDataPacket {
  sent_at: Date | string | null
}

function getSlackSlot(now: Date): { slot: SlackSlot | 0, text: string } {
  if (now.getDay() !== 3) {
    return { slot: 0, text: '' }
  }

  switch (now.getHours()) {
    case 9:
      return { slot: 1, text: "It's Wednesday! Time to vote for lunch today!" }
    case 10:
      return { slot: 2, text: "Reminder: It's Wednesday! Don't forget to vote for lunch today! Voting closes at 11 AM." }
    case 11:
      return { slot: 3, text: 'The restaurant with the most votes is the winner!' }
    default:
      return { slot: 0, text: '' }
  }
}

export async function sendSlackMessages() {
  const now = new Date()
  const { slot, text } = getSlackSlot(now)

  if (!slot) {
    return false
  }

  const pool = getPool()
  const [rows] = await pool.query<SlackLastSentRow[]>(
    'SELECT sent_at FROM slack_last_sent WHERE id = 1 LIMIT 1',
  )

  const lastSent = rows[0]?.sent_at ? new Date(rows[0].sent_at) : null
  const currentKey = `${now.getFullYear()}-${now.getMonth()}-${now.getDate()}-${slot}`

  if (lastSent) {
    const lastSlot = lastSent.getHours() === 9 ? 1 : lastSent.getHours() === 10 ? 2 : lastSent.getHours() === 11 ? 3 : 0
    const lastKey = `${lastSent.getFullYear()}-${lastSent.getMonth()}-${lastSent.getDate()}-${lastSlot}`

    if (lastKey === currentKey) {
      return false
    }
  }

  await $fetch('/api/slack/webhook', {
    method: 'POST',
    body: { text },
  })

  await pool.query(
    `
      INSERT INTO slack_last_sent (id, sent_at)
      VALUES (1, NOW())
      ON DUPLICATE KEY UPDATE sent_at = NOW()
    `,
  )

  return true
}
