#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

DB_NAME="${DB_DATABASE:-lunchcor}"
DB_USER="${DB_USERNAME:-lunchcor}"
DB_PASSWORD="${DB_PASSWORD:-lunchcor}"
DB_WAIT_TIMEOUT_SECONDS="${DB_WAIT_TIMEOUT_SECONDS:-180}"

run_mysql() {
	local sql="$1"
	printf '%s\n' "$sql" | docker compose exec -T -e "MYSQL_PWD=$DB_PASSWORD" database mysql "-u$DB_USER" "$DB_NAME"
}

run_mysql_scalar() {
	local sql="$1"
	printf '%s\n' "$sql" | docker compose exec -T -e "MYSQL_PWD=$DB_PASSWORD" database mysql -N -B "-u$DB_USER" "$DB_NAME"
}

run_migrations() {
	mapfile -t migration_files < <(find "$ROOT_DIR/database/init" -maxdepth 1 -type f -name '*.sql' | sort)

	if [ "${#migration_files[@]}" -eq 0 ]; then
		echo "No database migrations found."
		return
	fi

	run_mysql "CREATE TABLE IF NOT EXISTS schema_migrations (filename VARCHAR(255) PRIMARY KEY, applied_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP)"

	for migration_file in "${migration_files[@]}"; do
		migration_name="$(basename "$migration_file")"
		migration_count="$(docker compose exec -T database sh -lc "MYSQL_PWD='$DB_PASSWORD' mysql -N -B -u$DB_USER $DB_NAME -e \"SELECT COUNT(*) FROM schema_migrations WHERE filename = '$migration_name'\"")"

		if [ "$migration_count" = "1" ]; then
			echo "Skipping migration $migration_name (already applied)"
			continue
		fi

		echo "Applying migration $migration_name"
		docker compose exec -T database sh -lc "MYSQL_PWD='$DB_PASSWORD' mysql -u$DB_USER $DB_NAME" < "$migration_file"
		run_mysql "INSERT IGNORE INTO schema_migrations (filename) VALUES ('$migration_name')"
	done
}

wait_for_database_healthy() {
	local deadline=$((SECONDS + DB_WAIT_TIMEOUT_SECONDS))

	while [ "$SECONDS" -lt "$deadline" ]; do
		container_id="$(docker compose ps -q database)"

		if [ -z "$container_id" ]; then
			echo "Waiting for database container to be created..."
			sleep 3
			continue
		fi

		health_status="$(docker inspect --format '{{if .State.Health}}{{.State.Health.Status}}{{else}}{{.State.Status}}{{end}}' "$container_id")"

		if [ "$health_status" = "healthy" ] || [ "$health_status" = "running" ]; then
			echo "Database is healthy."
			return
		fi

		echo "Waiting for database to become healthy..."
		sleep 3
	done

	echo "Database did not become healthy within $DB_WAIT_TIMEOUT_SECONDS seconds" >&2
	exit 1
}

echo "[1/6] Installing frontend dependencies"
npm --prefix src install

echo "[2/6] Building frontend"
npm run build

echo "[3/6] Starting database container"
docker compose rm -fsv database
docker compose up --build -d --no-deps database

echo "[4/6] Waiting for database health"
wait_for_database_healthy

echo "[5/6] Running database migrations"
run_migrations

echo "[6/6] Starting frontend container"
docker compose up --build -d frontend

echo "Setup complete."
echo "Frontend: http://localhost:${FRONTEND_PORT:-3000}"
echo "Database: localhost:${DB_PORT:-3306}"
