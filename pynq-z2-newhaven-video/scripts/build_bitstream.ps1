$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent $PSScriptRoot
$vivado = 'C:\AMDDesignTools\2026.1\Vivado\bin\vivado.bat'
$buildScript = Join-Path $repoRoot 'vivado\build_bitstream.tcl'

if (-not (Test-Path -LiteralPath $vivado)) {
    throw "Vivado 2026.1 was not found at $vivado"
}

& $vivado -mode batch -nojournal -nolog -source $buildScript
if ($LASTEXITCODE -ne 0) { throw 'Bitstream build failed' }

Write-Host 'PASS: build\output contains the .bit, .xsa, and reports'
