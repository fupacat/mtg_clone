<#
PowerShell helper: build-unity.ps1
Usage: pwsh tools\build-unity.ps1 -UnityPath "C:\Program Files\Unity\Hub\Editor\6.4\Editor\Unity.exe" -Target Windows64 -BuildDir build\Windows
#>
param(
    [string]$UnityPath = $env:UNITY_PATH,
    [string]$Target = "Windows64",
    [string]$BuildDir = "build\$Target",
    [switch]$Clean
)
if (-not $UnityPath) { Write-Error "UNITY_PATH or -UnityPath must be set"; exit 2 }
if ($Clean -and (Test-Path $BuildDir)) { Remove-Item $BuildDir -Recurse -Force }
New-Item -ItemType Directory -Force -Path $BuildDir | Out-Null
$log = Join-Path $BuildDir "unity-build.log"
& "$UnityPath" -batchmode -nographics -quit -projectPath "$PWD" -buildTarget $Target -executeMethod BuildScript.PerformBuild -logFile $log
$rc = $LASTEXITCODE
if ($rc -ne 0) { Write-Error "Unity build failed. See $log"; exit $rc }
Write-Output "Build completed. Log: $log"