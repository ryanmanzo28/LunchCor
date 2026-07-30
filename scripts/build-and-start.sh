#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

echo "[1/3] Installing frontend dependencies"
npm --prefix src install

echo "[2/3] Building frontend"
npm run build

echo "[3/3] Starting Docker containers"
docker compose up --build -d

echo "Setup complete."
echo "Frontend: http://localhost:${FRONTEND_PORT:-3000}"
echo "Database: localhost:${DB_PORT:-3306}"
