import { getPool } from "~/server/utils/db";

export async function sendSlackMessages() {
  const now = new Date();

  // Only Wednesday
  if (now.getDay() !== 3) return;

  let slot = 0;
  let text = "";

  switch (now.getHours()) {
    case 9:
      slot = 1;
      text = "It's Wednesday! Time to vote for lunch today!";
      break;

    case 10:
      slot = 2;
      text = "Reminder: It's Wednesday! Don't forget to vote for lunch today! Voting closes at 11 AM.";
      break;

    case 11:
      slot = 3;
      text = "The restaurant with the most votes is the winner!";
      break;

    default:
      return;
  }

  const pool = getPool();

  // Unique identifier for this message window
  const sendKey = `${now.getFullYear()}-${now.getMonth()}-${now.getDate()}-${slot}`;

  // Get last sent time
  const [rows] = await pool.query(
    `SELECT last_sent FROM slack_last_sent WHERE id = 1`
  );

  const lastSent = rows[0]?.last_sent
    ? new Date(rows[0].last_sent)
    : null;

  // Prevent duplicate sends
  if (lastSent) {
    const lastKey = `${lastSent.getFullYear()}-${lastSent.getMonth()}-${lastSent.getDate()}-${Math.floor(lastSent.getHours() - 9) + 1}`;

    if (lastKey === sendKey) {
      return;
    }
  }

  // Send Slack message
  await $fetch("/api/slack/webhook", {
    method: "POST",
    body: {
      text
    }
  });

  // Update database timestamp
  await pool.query(
    `
    INSERT INTO slack_last_sent (id, last_sent)
    VALUES (1, NOW())
    ON DUPLICATE KEY UPDATE last_sent = NOW()
    `
  );
}