# Start the Lilac JavaFX client.
# Usage: .\run-client.ps1 guest localhost

param(
    [string]$LoginId = "guest",
    [string]$ServerHost = "localhost"
)

$ErrorActionPreference = "Stop"
$ProjectRoot = Split-Path -Parent $PSScriptRoot
$Bin = Join-Path $ProjectRoot "bin"

if (-not (Test-Path $Bin)) {
    Write-Error "Build output not found at $Bin. Import the project into Eclipse and build first."
}

# JavaFX module path — set JAVAFX_SDK to your JavaFX SDK lib folder if not using Eclipse.
$javafxPath = $env:JAVAFX_SDK
$moduleArgs = @()
if ($javafxPath -and (Test-Path $javafxPath)) {
    $moduleArgs = @("--module-path", $javafxPath, "--add-modules", "javafx.controls,javafx.fxml")
}

Push-Location $Bin
try {
    java @moduleArgs -cp ".;../lib/*" application.LilacApp $LoginId $ServerHost
}
finally {
    Pop-Location
}
