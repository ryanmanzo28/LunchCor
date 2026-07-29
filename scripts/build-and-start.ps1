$ErrorActionPreference = 'Stop'
$rootDir = Split-Path -Parent $PSScriptRoot
Set-Location $rootDir

Write-Host '[1/3] Installing frontend dependencies'
npm --prefix src install

Write-Host '[2/3] Building frontend'
npm run build

Write-Host '[3/3] Starting Docker containers'
docker compose up --build -d

$frontendPort = if ($env:FRONTEND_PORT) { $env:FRONTEND_PORT } else { '3000' }
$dbPort = if ($env:DB_PORT) { $env:DB_PORT } else { '3306' }

Write-Host 'Setup complete.'
Write-Host "Frontend: http://localhost:$frontendPort"
Write-Host "Database: localhost:$dbPort"
