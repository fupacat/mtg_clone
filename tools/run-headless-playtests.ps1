<#
Run Unity playmode tests in batch/headless mode.
Usage: pwsh tools\run-headless-playtests.ps1 -UnityPath "%UNITY_PATH%"
#>
param(
    [string]$UnityPath = $env:UNITY_PATH,
    [string]$ResultsFile = "test-results\playmode-results.xml"
)
if (-not $UnityPath) { Write-Error "UNITY_PATH or -UnityPath must be set"; exit 2 }
New-Item -ItemType Directory -Force -Path (Split-Path $ResultsFile)
& "$UnityPath" -batchmode -nographics -quit -projectPath "$PWD" -runTests -testPlatform PlayMode -testResults $ResultsFile -logFile "$ResultsFile.log"
$rc = $LASTEXITCODE
if ($rc -ne 0) { Write-Error "Playmode tests failed. See $ResultsFile.log"; exit $rc }
Write-Output "Playmode tests succeeded. Results: $ResultsFile"