param(
    [string]$Destination = (Join-Path $PSScriptRoot '..\.vendor\pynq-supported-board-file')
)

$ErrorActionPreference = 'Stop'
$destinationPath = [System.IO.Path]::GetFullPath($Destination)

if (Test-Path -LiteralPath (Join-Path $destinationPath 'pynq-z2\A.0\board.xml')) {
    Write-Host "PYNQ-Z2 board files already exist at $destinationPath"
    exit 0
}

if (Test-Path -LiteralPath $destinationPath) {
    throw "Destination exists but does not contain PYNQ-Z2 board files: $destinationPath"
}

New-Item -ItemType Directory -Path (Split-Path -Parent $destinationPath) -Force | Out-Null
git clone --depth 1 https://github.com/xupsh/pynq-supported-board-file.git $destinationPath
if ($LASTEXITCODE -ne 0) {
    throw "git clone failed with exit code $LASTEXITCODE"
}

Write-Host "Downloaded PYNQ-Z2 board files to $destinationPath"
