# 1. تحديد الروابط ومكان التثبيت
$vipsVersion = "8.18.0"
# https://github.com/libvips/build-win64-mxe/releases/download/v8.18.0/vips-dev-w64-web-8.18.0.zip
$url = "https://github.com/libvips/build-win64-mxe/releases/download/v$vipsVersion/vips-dev-w64-web-$vipsVersion.zip"
$installPath = "$env:USERPROFILE\.pixify\vips"
$zipFile = "$env:TEMP\vips.zip"

# 2. إنشاء المجلد وتحميل الملف
if (!(Test-Path $installPath)) { New-Item -ItemType Directory -Force -Path $installPath }
Write-Host "📥 Downloading libvips..." -ForegroundColor Cyan
Invoke-WebRequest -Uri $url -OutFile $zipFile

# 3. فك الضغط
Write-Host "📦 Extracting files..." -ForegroundColor Cyan
Expand-Archive -Path $zipFile -DestinationPath $installPath -Force

# 4. إضافة مسار الـ bin للـ PATH الخاص بالمستخدم (عشان يشتغل علطول)
$vipsBinPath = Join-Path $installPath "vips-dev-8.15\bin"
$currentPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($currentPath -notlike "*$vipsBinPath*") {
    $newPath = "$currentPath;$vipsBinPath"
    [Environment]::SetEnvironmentVariable("Path", $newPath, "User")
    $env:Path = $newPath # تحديث الجلسة الحالية
    Write-Host "✅ libvips added to PATH!" -ForegroundColor Green
} else {
    Write-Host "ℹ️ libvips is already in PATH." -ForegroundColor Yellow
}

Write-Host "🚀 Installation complete! Please restart your terminal." -ForegroundColor Green
