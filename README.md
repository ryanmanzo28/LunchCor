# LunchCor

Monorepo skeleton for a lunch ordering app with:
- Nuxt full-stack app
- MySQL database
- Docker Compose local environment

## Quick Start

1. Copy environment file:

	```powershell
	Copy-Item .env.example .env
	```

	Set `JWT_SECRET` in `.env` to a strong random value for token verification.

2. Start all services:

	```powershell
	docker compose up --build
	```

3. Open:
- Frontend: http://localhost:3000
- API health: http://localhost:3000/api/health

## Local Dev Without Docker

Frontend:

```powershell
npm run dev
```

Alternative (inside `src` directly):

```powershell
cd src
npm install
npm run dev
```

Database:
- Use Docker MySQL from compose, or provide your own MySQL and set values in .env.

## Project Scripts

Run from repository root:

```powershell
npm run dev
npm run build
npm run start
npm run typecheck
npm run check
```

## API

Base URL: `/api`

Authentication:
- Session auth uses the `jwt` cookie.
- Some admin endpoints also require explicit admin credentials in the request.

### Health

`GET /api/health`
- Basic health check.

### Auth

`POST /api/auth/login`
- Body: `{ email, password }`
- Returns: `{ status, token, user }`
- Sets `jwt` and `admin` cookies.

`GET /api/auth/restore-session`
- Restores the current logged-in user from the auth cookie.

`POST /api/auth/logout`
- Clears auth cookies.

### Users

`POST /api/users/create`
- Body: `{ name, email, password }`
- Creates a standard user account.

`GET /api/users/:id`
- Auth required.
- Returns a sanitized user object.
- Non-admin users may only fetch their own record.

`DELETE /api/users/:id`
- Auth required.
- Users may only delete their own account.

`GET /api/users/search?q=term`
- Auth required.
- Returns matching users by name or email.

### Restaurants

`GET /api/restaurants`
- Returns active restaurants.

`GET /api/restaurants/:id/menu`
- Returns menu items for a restaurant.
- Uses normalized `menu_items` rows first, then falls back to legacy stored menu JSON when needed.

`POST /api/restaurants/create`
- Body: `{ name, link, cuisine?, description?, color?, icon? }`
- Creates a restaurant.

### Voting

`POST /api/votes/vote`
- Auth required.
- Body: `{ restaurantId }`
- The server derives the voter identity from auth context.

### Admin

`PATCH /api/admin/admin`
- Body: `{ id, adminPassword }`
- Elevates a user to admin using the shared admin password.

`GET /api/admin/users?id=...&password=...`
- Returns users after admin credential verification.

`GET /api/admin/analytics?id=...&password=...&startDate=YYYY-MM-DD&endDate=YYYY-MM-DD`
- Returns analytics for the given date range.

`DELETE /api/admin/restaurants/:id?id=...&password=...`
- Soft-deletes a restaurant after admin verification.

`DELETE /api/admin/votes/votes`
- Admin-only vote reset/delete route.

### Slack

`POST /api/slack/webhook`
- Slack webhook entrypoint used by the app's Slack integration.

## Status

The frontend includes a polished demo experience for signing in and voting on today's lunch options. Votes are currently held in browser memory so the UI can be explored without database setup; the database schema is ready for a persistent API implementation.
