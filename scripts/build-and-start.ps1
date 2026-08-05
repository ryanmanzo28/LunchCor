$ErrorActionPreference = 'Stop'
$rootDir = Split-Path -Parent $PSScriptRoot
Set-Location $rootDir

$dbName = if ($env:DB_DATABASE) { $env:DB_DATABASE } else { 'lunchcor' }
$dbUser = if ($env:DB_USERNAME) { $env:DB_USERNAME } else { 'lunchcor' }
$dbPassword = if ($env:DB_PASSWORD) { $env:DB_PASSWORD } else { 'lunchcor' }
$dbWaitTimeoutSeconds = 180

function Invoke-MySqlCommand {
	param(
		[Parameter(Mandatory = $true)]
		[string]$Sql,
		[Parameter(Mandatory = $true)]
		[string]$StepName
	)

	$escapedPassword = $dbPassword.Replace("'", "''")
	$escapedSql = $Sql.Replace("`r", '').Replace("`n", ' ').Replace('"', '\"')
	Invoke-CheckedCommand -StepName $StepName -Command {
		docker compose exec -T database sh -lc "MYSQL_PWD='$escapedPassword' mysql -u$dbUser $dbName -e \"$escapedSql\""
	}
}

function Invoke-DatabaseMigrations {
	$migrationFiles = Get-ChildItem -Path (Join-Path $rootDir 'database/init') -Filter '*.sql' | Sort-Object Name

	if ($migrationFiles.Count -eq 0) {
		Write-Host 'No database migrations found.'
		return
	}

	Invoke-MySqlCommand -StepName 'Ensuring schema_migrations table' -Sql @"
CREATE TABLE IF NOT EXISTS schema_migrations (
	filename VARCHAR(255) PRIMARY KEY,
	applied_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
)
"@

	foreach ($migrationFile in $migrationFiles) {
		$migrationName = $migrationFile.Name
		$checkSql = "SELECT COUNT(*) AS migration_count FROM schema_migrations WHERE filename = '$migrationName'"
		$checkOutput = docker compose exec -T database sh -lc "MYSQL_PWD='$($dbPassword.Replace("'", "''"))' mysql -N -B -u$dbUser $dbName -e \"$($checkSql.Replace('"', '\"'))\""

		if ($LASTEXITCODE -ne 0) {
			throw "Checking migration $migrationName failed with exit code $LASTEXITCODE"
		}

		if ($checkOutput.Trim() -eq '1') {
			Write-Host "Skipping migration $migrationName (already applied)"
			continue
		}

		Write-Host "Applying migration $migrationName"
		Invoke-CheckedCommand -StepName "Applying migration $migrationName" -Command {
			Get-Content -Raw -Path $migrationFile.FullName |
				docker compose exec -T database sh -lc "MYSQL_PWD='$($dbPassword.Replace("'", "''"))' mysql -u$dbUser $dbName"
		}

		Invoke-MySqlCommand -StepName "Recording migration $migrationName" -Sql "INSERT INTO schema_migrations (filename) VALUES ('$migrationName')"
	}
}

function Wait-ForDatabaseHealthy {
	$deadline = (Get-Date).AddSeconds($dbWaitTimeoutSeconds)

	while ((Get-Date) -lt $deadline) {
		$containerId = docker compose ps -q database

		if ($LASTEXITCODE -ne 0) {
			throw "Resolving database container id failed with exit code $LASTEXITCODE"
		}

		if (-not $containerId) {
			Write-Host 'Waiting for database container to be created...'
			Start-Sleep -Seconds 3
			continue
		}

		$health = docker inspect --format '{{if .State.Health}}{{.State.Health.Status}}{{else}}{{.State.Status}}{{end}}' $containerId

		if ($LASTEXITCODE -ne 0) {
			throw "Checking database container health failed with exit code $LASTEXITCODE"
		}

		if ($health -eq 'healthy' -or $health -eq 'running') {
			Write-Host 'Database is healthy.'
			return
		}

		Write-Host 'Waiting for database to become healthy...'
		Start-Sleep -Seconds 3
	}

	throw "Database did not become healthy within $dbWaitTimeoutSeconds seconds"
}

function Invoke-CheckedCommand {
	param(
		[Parameter(Mandatory = $true)]
		[scriptblock]$Command,
		[Parameter(Mandatory = $true)]
		[string]$StepName
	)

	& $Command
	if ($LASTEXITCODE -ne 0) {
		throw "$StepName failed with exit code $LASTEXITCODE"
	}
}

$strictBuild = $env:STRICT_FRONTEND_BUILD -eq '1'

Write-Host '[1/6] Installing frontend dependencies'
Invoke-CheckedCommand -StepName 'Installing frontend dependencies' -Command { npm --prefix src install }

Write-Host '[2/6] Building frontend'
if ($strictBuild) {
	Invoke-CheckedCommand -StepName 'Building frontend' -Command { npm run build }
}
else {
	& { npm run build }
	if ($LASTEXITCODE -ne 0) {
		Write-Warning 'Building frontend failed; continuing. Set STRICT_FRONTEND_BUILD=1 to make this step fail-fast.'
		$global:LASTEXITCODE = 0
	}
}

Write-Host '[3/6] Starting database container'
Invoke-CheckedCommand -StepName 'Starting database container' -Command { docker compose up --build -d database }

Write-Host '[4/6] Waiting for database health'
Wait-ForDatabaseHealthy

Write-Host '[5/6] Running database migrations'
Invoke-DatabaseMigrations

Write-Host '[6/6] Starting frontend container'
Invoke-CheckedCommand -StepName 'Starting frontend container' -Command { docker compose up --build -d frontend }

$frontendPort = if ($env:FRONTEND_PORT) { $env:FRONTEND_PORT } else { '3000' }
$dbPort = if ($env:DB_PORT) { $env:DB_PORT } else { '3306' }

Write-Host 'Setup complete.'
Write-Host "Frontend: http://localhost:$frontendPort"
Write-Host "Database: localhost:$dbPort"
