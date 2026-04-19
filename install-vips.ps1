# 1. Define links and installation path
$vipsVersion = "8.18.0"
$url = "https://github.com/libvips/build-win64-mxe/releases/download/v$vipsVersion/vips-dev-w64-web-$vipsVersion.zip"
$installPath = "$env:USERPROFILE\.pixify\vips"
$zipFile = "$env:TEMP\vips.zip"

# 2. Create directory and download the file
if (!(Test-Path $installPath)) { New-Item -ItemType Directory -Force -Path $installPath }
Write-Host "📥 Downloading libvips..." -ForegroundColor Cyan
Invoke-WebRequest -Uri $url -OutFile $zipFile

# 3. Extracting the archive
Write-Host "📦 Extracting files..." -ForegroundColor Cyan
Expand-Archive -Path $zipFile -DestinationPath $installPath -Force

# 4. Add the bin folder to User PATH (to make it work globally)
$vipsBinPath = Join-Path $installPath "vips-dev-8.18\bin"
$currentPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($currentPath -notlike "*$vipsBinPath*") {
    $newPath = "$currentPath;$vipsBinPath"
    [Environment]::SetEnvironmentVariable("Path", $newPath, "User")
    $env:Path = $newPath # Update current session
    Write-Host "✅ libvips added to PATH!" -ForegroundColor Green
} else {
    Write-Host "ℹ️ libvips is already in PATH." -ForegroundColor Yellow
}

Write-Host "🚀 Installation complete! Please restart your terminal." -ForegroundColor Green
