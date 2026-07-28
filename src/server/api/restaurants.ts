import mysql from 'mysql2/promise'

type MysqlGlobal = typeof globalThis & { __lunchcorPool?: mysql.Pool }

interface RestaurantRow extends mysql.RowDataPacket {
	id: number
	name: string
	cuisine: string
	description: string | null
	times_ordered: number
	average_rating: number | string
	icon: string
	color: string
	votes: number
}

interface RestaurantCreateInput {
	name: string
	cuisine?: string
	description?: string | null
	icon?: string
	color?: string
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

async function hasVotesTable() {
	const pool = getPool()
	const [rows] = await pool.query<Array<mysql.RowDataPacket & { has_table: number }>>(
		`SELECT COUNT(*) AS has_table
		 FROM information_schema.tables
		 WHERE table_schema = DATABASE()
		   AND table_name = 'votes'`,
	)

	return Number(rows[0]?.has_table || 0) > 0
}

async function listAllRestaurants() {
	const pool = getPool()
	const canUseVotes = await hasVotesTable()
	const query = canUseVotes
		? `
			SELECT
				r.id,
				r.name,
				r.cuisine,
				r.description,
				r.times_ordered,
				r.average_rating,
				r.icon,
				r.color,
				COALESCE(v.votes, 0) AS votes
			FROM restaurants r
			LEFT JOIN (
				SELECT restaurant_id, COUNT(*) AS votes
				FROM votes
				GROUP BY restaurant_id
			) v ON v.restaurant_id = r.id
			WHERE r.active = TRUE
			ORDER BY r.name ASC
		`
		: `
			SELECT
				r.id,
				r.name,
				r.cuisine,
				r.description,
				r.times_ordered,
				r.average_rating,
				r.icon,
				r.color,
				0 AS votes
			FROM restaurants r
			WHERE r.active = TRUE
			ORDER BY r.name ASC
		`

	const [rows] = await pool.query<RestaurantRow[]>(query)

	return rows.map((row) => ({
		id: row.id,
		name: row.name,
		cuisine: row.cuisine,
		description: row.description ?? '',
		rating: Number(row.average_rating),
		orders: row.times_ordered,
		votes: row.votes,
		icon: row.icon,
		color: row.color,
	}))
}

async function addRestaurant(input: RestaurantCreateInput) {
	const pool = getPool()
	const canUseVotes = await hasVotesTable()
	const normalizedName = input.name.trim()
	const fallbackIcon = normalizedName.charAt(0).toUpperCase() || 'R'
	const [result] = await pool.execute<mysql.ResultSetHeader>(
		'INSERT INTO restaurants (name, cuisine, description, icon, color, active) VALUES (?, ?, ?, ?, ?, TRUE)',
		[
			normalizedName,
			input.cuisine?.trim() || 'General',
			input.description ?? null,
			input.icon?.trim() || fallbackIcon,
			input.color?.trim() || '#9aa5b1',
		],
	)

	const query = canUseVotes
		? `
			SELECT
				r.id,
				r.name,
				r.cuisine,
				r.description,
				r.times_ordered,
				r.average_rating,
				r.icon,
				r.color,
				COALESCE(v.votes, 0) AS votes
			FROM restaurants r
			LEFT JOIN (
				SELECT restaurant_id, COUNT(*) AS votes
				FROM votes
				GROUP BY restaurant_id
			) v ON v.restaurant_id = r.id
			WHERE r.id = ?
			LIMIT 1
		`
		: `
			SELECT
				r.id,
				r.name,
				r.cuisine,
				r.description,
				r.times_ordered,
				r.average_rating,
				r.icon,
				r.color,
				0 AS votes
			FROM restaurants r
			WHERE r.id = ?
			LIMIT 1
		`

	const [rows] = await pool.execute<RestaurantRow[]>(query, [result.insertId])

	const created = rows[0]

	return {
		id: created.id,
		name: created.name,
		cuisine: created.cuisine,
		description: created.description ?? '',
		rating: Number(created.average_rating),
		orders: created.times_ordered,
		votes: created.votes,
		icon: created.icon,
		color: created.color,
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
				cuisine: body.cuisine,
				description: body.description,
				icon: body.icon,
				color: body.color,
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