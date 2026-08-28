$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent $PSScriptRoot
$vivado = 'C:\AMDDesignTools\2026.1\Vivado\bin\vivado.bat'
if (-not (Test-Path -LiteralPath $vivado)) {
    throw "Vivado 2026.1 was not found at $vivado"
}

$packageScript = Join-Path $repoRoot 'vivado\package_custom_ip.tcl'
$projectScript = Join-Path $repoRoot 'vivado\create_microblaze_project.tcl'

& $vivado -mode batch -nojournal -nolog -source $packageScript
if ($LASTEXITCODE -ne 0) { throw 'Custom-IP packaging failed' }

& $vivado -mode batch -nojournal -nolog -source $projectScript
if ($LASTEXITCODE -ne 0) { throw 'MicroBlaze Vivado project creation failed' }

Write-Host 'PASS: Vivado project is ready under build\pynq_z2_microblaze'
