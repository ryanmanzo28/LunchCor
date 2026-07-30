$ErrorActionPreference = 'Stop'

$srcDir = Split-Path -Parent $PSScriptRoot
$repoRoot = Split-Path -Parent $srcDir
$rootScript = Join-Path $repoRoot 'scripts\build-and-start.ps1'

if (-not (Test-Path $rootScript)) {
  throw "Could not find root script at: $rootScript"
}

# Delegate to the root script so the same command works from src/.
& $rootScript @args
