import mysql from 'mysql2/promise'

type MysqlGlobal = typeof globalThis & { __lunchcorPool?: mysql.Pool }

interface RestaurantRow extends mysql.RowDataPacket {
	id: number
	name: string
	description: string | null
	times_ordered: number
	average_rating: number | string
	votes: number
}

interface RestaurantCreateInput {
	name: string
	description?: string | null
}

function getPool() {
	const globalRef = globalThis as MysqlGlobal

	if (!globalRef.__lunchcorPool) {
		globalRef.__lunchcorPool = mysql.createPool({
			host: process.env.DB_HOST || '127.0.0.1',
			port: Number.parseInt(process.env.DB_PORT || '3306', 10),
			user: process.env.DB_USERNAME || 'lunchcor',
			password: process.env.DB_PASSWORD || 'lunchcor',
			database: process.env.DB_DATABASE || 'lunchcor',
			connectionLimit: 10,
		})
	}

	return globalRef.__lunchcorPool
}

async function listAllRestaurants() {
	const pool = getPool()
	const [rows] = await pool.query<RestaurantRow[]>(`
		SELECT
			r.id,
			r.name,
			r.description,
			r.times_ordered,
			r.average_rating,
			COALESCE(v.votes, 0) AS votes
		FROM restaurants r
		LEFT JOIN (
			SELECT restaurant_id, COUNT(*) AS votes
			FROM votes
			GROUP BY restaurant_id
		) v ON v.restaurant_id = r.id
		WHERE r.active = TRUE
		ORDER BY r.name ASC
	`)

	return rows.map((row) => ({
		id: row.id,
		name: row.name,
		description: row.description,
		timesOrdered: row.times_ordered,
		averageRating: Number(row.average_rating),
		votes: row.votes,
	}))
}

async function addRestaurant(input: RestaurantCreateInput) {
	const pool = getPool()
	const [result] = await pool.execute<mysql.ResultSetHeader>(
		'INSERT INTO restaurants (name, description, active) VALUES (?, ?, TRUE)',
		[input.name.trim(), input.description ?? null],
	)

	const [rows] = await pool.execute<RestaurantRow[]>(
		`SELECT
			r.id,
			r.name,
			r.description,
			r.times_ordered,
			r.average_rating,
			COALESCE(v.votes, 0) AS votes
		 FROM restaurants r
		 LEFT JOIN (
			 SELECT restaurant_id, COUNT(*) AS votes
			 FROM votes
			 GROUP BY restaurant_id
		 ) v ON v.restaurant_id = r.id
		 WHERE r.id = ?
		 LIMIT 1`,
		[result.insertId],
	)

	const created = rows[0]

	return {
		id: created.id,
		name: created.name,
		description: created.description,
		timesOrdered: created.times_ordered,
		averageRating: Number(created.average_rating),
		votes: created.votes,
	}
}

async function removeRestaurant(id: number) {
	const pool = getPool()
	const [result] = await pool.execute<mysql.ResultSetHeader>(
		'UPDATE restaurants SET active = FALSE WHERE id = ? AND active = TRUE',
		[id],
	)

	return result.affectedRows > 0
}

export default defineEventHandler(async (event) => {
	const method = event.node.req.method || 'GET'

	try {
		if (method === 'GET') {
			const restaurants = await listAllRestaurants()

			return {
				status: 'ok',
				count: restaurants.length,
				restaurants,
			}
		}

		if (method === 'POST') {
			const body = await readBody<Partial<RestaurantCreateInput>>(event)

			if (!body?.name || !body.name.trim()) {
				throw createError({
					statusCode: 400,
					statusMessage: 'Restaurant name is required',
				})
			}

			const restaurant = await addRestaurant({
				name: body.name,
				description: body.description,
			})

			setResponseStatus(event, 201)

			return {
				status: 'created',
				restaurant,
			}
		}

		if (method === 'DELETE') {
			const query = getQuery(event)
			const idRaw = typeof query.id === 'string' ? query.id : ''
			const id = Number.parseInt(idRaw, 10)

			if (!Number.isInteger(id) || id <= 0) {
				throw createError({
					statusCode: 400,
					statusMessage: 'A valid restaurant id is required',
				})
			}

			const removed = await removeRestaurant(id)

			if (!removed) {
				throw createError({
					statusCode: 404,
					statusMessage: 'Restaurant not found',
				})
			}

			return {
				status: 'deleted',
				id,
			}
		}

		throw createError({
			statusCode: 405,
			statusMessage: 'Method Not Allowed',
		})
	}
	catch (error) {
		if (isError(error)) {
			throw error
		}

		console.error('Failed to list restaurants:', error)
		throw createError({
			statusCode: 500,
			statusMessage: 'Unable to process restaurant request',
		})
	}
})
