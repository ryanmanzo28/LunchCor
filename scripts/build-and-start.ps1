$ErrorActionPreference = 'Stop'
$rootDir = Split-Path -Parent $PSScriptRoot
Set-Location $rootDir

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

Write-Host '[1/3] Installing frontend dependencies'
Invoke-CheckedCommand -StepName 'Installing frontend dependencies' -Command { npm --prefix src install }

Write-Host '[2/3] Building frontend'
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

Write-Host '[3/3] Starting Docker containers'
Invoke-CheckedCommand -StepName 'Starting Docker containers' -Command { docker compose up --build -d }

$frontendPort = if ($env:FRONTEND_PORT) { $env:FRONTEND_PORT } else { '3000' }
$dbPort = if ($env:DB_PORT) { $env:DB_PORT } else { '3306' }

Write-Host 'Setup complete.'
Write-Host "Frontend: http://localhost:$frontendPort"
Write-Host "Database: localhost:$dbPort"
