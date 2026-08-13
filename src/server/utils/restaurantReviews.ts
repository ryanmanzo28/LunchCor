import mysql from 'mysql2/promise'
import { getPool } from '~/server/utils/db'
import type { RestaurantReview } from '@/types/review'

interface RestaurantReviewRow extends mysql.RowDataPacket {
  id: number
  user_id: number
  user_name: string
  restaurant_id: number
  rating: number
  review: string | null
  review_date: string
}

interface RestaurantReviewAggregateRow extends mysql.RowDataPacket {
  average_rating: number | string | null
  total_reviews: number
}

export async function ensureRestaurantReviewsTable() {
  const pool = getPool()

  await pool.query(`
    CREATE TABLE IF NOT EXISTS restaurant_reviews (
      id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
      user_id INT UNSIGNED NOT NULL,
      restaurant_id INT UNSIGNED NOT NULL,
      rating TINYINT UNSIGNED NOT NULL,
      review TEXT,
      review_date DATE NOT NULL,
      created DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
      CONSTRAINT fk_restaurant_reviews_user
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
      CONSTRAINT fk_restaurant_reviews_restaurant
        FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE CASCADE,
      CONSTRAINT chk_restaurant_reviews_rating CHECK (rating BETWEEN 1 AND 5),
      CONSTRAINT uq_restaurant_reviews_user_restaurant_day UNIQUE (user_id, restaurant_id, review_date)
    )
  `)
}

function normalizeAverage(value: unknown): number {
  const parsed = typeof value === 'number' ? value : Number(value)
  if (!Number.isFinite(parsed)) {
    return 0
  }

  return Math.round(parsed * 100) / 100
}

function mapReview(row: RestaurantReviewRow): RestaurantReview {
  return {
    id: row.id,
    restaurantId: row.restaurant_id,
    userId: row.user_id,
    userName: row.user_name,
    rating: Number(row.rating),
    review: row.review ?? '',
    reviewDate: row.review_date,
  }
}

export async function listRestaurantReviews(restaurantId: number, limit = 20) {
  const pool = getPool()
  await ensureRestaurantReviewsTable()

  const [reviewRows] = await pool.query<RestaurantReviewRow[]>(
    `SELECT
      rr.id,
      rr.user_id,
      u.name AS user_name,
      rr.restaurant_id,
      rr.rating,
      rr.review,
      DATE_FORMAT(rr.review_date, '%Y-%m-%d') AS review_date
    FROM restaurant_reviews rr
    INNER JOIN users u ON u.id = rr.user_id
    WHERE rr.restaurant_id = ?
    ORDER BY rr.created DESC
    LIMIT ?`,
    [restaurantId, limit],
  )

  const [aggregateRows] = await pool.query<RestaurantReviewAggregateRow[]>(
    `SELECT
      AVG(rating) AS average_rating,
      COUNT(*) AS total_reviews
    FROM restaurant_reviews
    WHERE restaurant_id = ?`,
    [restaurantId],
  )

  const aggregate = aggregateRows[0]

  return {
    averageRating: normalizeAverage(aggregate?.average_rating ?? 0),
    totalReviews: Number(aggregate?.total_reviews ?? 0),
    reviews: reviewRows.map(mapReview),
  }
}

export async function createRestaurantReview(params: {
  restaurantId: number
  userId: number
  rating: number
  review?: string
}) {
  const pool = getPool()
  const reviewText = params.review?.trim() ?? ''

  await ensureRestaurantReviewsTable()

  await pool.execute(
    `INSERT INTO restaurant_reviews (user_id, restaurant_id, rating, review, review_date)
     VALUES (?, ?, ?, ?, CURDATE())`,
    [params.userId, params.restaurantId, params.rating, reviewText || null],
  )

  const [aggregateRows] = await pool.query<RestaurantReviewAggregateRow[]>(
    `SELECT AVG(rating) AS average_rating
     FROM restaurant_reviews
     WHERE restaurant_id = ?`,
    [params.restaurantId],
  )

  const averageRating = normalizeAverage(aggregateRows[0]?.average_rating ?? 0)

  await pool.execute(
    'UPDATE restaurants SET average_rating = ? WHERE id = ?',
    [averageRating, params.restaurantId],
  )

  return { averageRating }
}
