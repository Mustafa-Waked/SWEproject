# Start the Lilac OCSF server (default port 5555).
# Requires: JDK with project built in Eclipse (bin/ output) or equivalent classpath.

$ErrorActionPreference = "Stop"
$ProjectRoot = Split-Path -Parent $PSScriptRoot
$Bin = Join-Path $ProjectRoot "bin"

if (-not (Test-Path $Bin)) {
    Write-Error "Build output not found at $Bin. Import the project into Eclipse and build first."
}

Push-Location $Bin
try {
    java -cp ".;../lib/*" ocsf.LilacServer
}
finally {
    Pop-Location
}
