# Requires -Version 5.1
$version = "1.0.0"
$installDir = "$env:USERPROFILE\.pixify"
$binDir = "$installDir\bin"
$url = "https://github.com/Mahammed-Gaber/pixify/releases/download/v$version/Pixify-Pro-Windows-v$version.zip"
$zipFile = "$env:TEMP\pixify-pro.zip"

# 1. تثبيت libvips أولاً (باستخدام سكريبتك الذكي)
Write-Host "🔍 Step 1: Checking libvips dependencies..." -ForegroundColor Cyan
irm https://raw.githubusercontent.com/Mahammed-Gaber/pixify/main/install-vips.ps1 | iex

# 2. تحميل وتثبيت Pixify Pro
if (!(Test-Path $binDir)) { New-Item -ItemType Directory -Force -Path $binDir }
Write-Host "📥 Step 2: Downloading Pixify Pro v$version..." -ForegroundColor Cyan
Invoke-WebRequest -Uri $url -OutFile $zipFile

Write-Host "📦 Step 3: Extracting Pixify..." -ForegroundColor Cyan
Expand-Archive -Path $zipFile -DestinationPath $binDir -Force

# 3. إضافة Pixify للـ PATH
$currentPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($currentPath -notlike "*$binDir*") {
    [Environment]::SetEnvironmentVariable("Path", "$currentPath;$binDir", "User")
    $env:Path += ";$binDir"
    Write-Host "✅ Added Pixify to User PATH" -ForegroundColor Green
}

Write-Host "🚀 Installation Complete! Restart your terminal and run 'pixify-pro'" -ForegroundColor Green