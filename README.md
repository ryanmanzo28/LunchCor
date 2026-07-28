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

## Status

The frontend includes a polished demo experience for signing in and voting on today's lunch options. Votes are currently held in browser memory so the UI can be explored without database setup; the database schema is ready for a persistent API implementation.
