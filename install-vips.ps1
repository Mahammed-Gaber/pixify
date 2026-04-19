#Requires -Version 5.1
<#
.SYNOPSIS
  Downloads libvips (web build) for Windows 64-bit and adds it to the user PATH.

.DESCRIPTION
  Uses a fast download path when possible:
  - BITS (Start-BitsTransfer) — often faster and resumable on Windows
  - curl.exe (Windows 10+) — good throughput, supports retries
  - Invoke-WebRequest — fallback

  Installs under: $env:USERPROFILE\.pixify\vips
  Skips re-download / re-extract if the same version is already present.

.NOTES
  Pixify Free/Pro on Windows need vips DLLs on PATH. The "web" zip (~11 MB) is enough for Free WebP;
  use -AllBuild for the larger "all" formats build if needed.
#>

param(
    [string] $VipsVersion = "8.18.0",
    [switch] $AllBuild,
    [switch] $Force
)

$ErrorActionPreference = "Stop"

# TLS 1.2 for older PowerShell / some hosts
try {
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
} catch { }

$kind = if ($AllBuild) { "all" } else { "web" }
$url = "https://github.com/libvips/build-win64-mxe/releases/download/v$VipsVersion/vips-dev-w64-$kind-$VipsVersion.zip"
$installRoot = Join-Path $env:USERPROFILE ".pixify\vips"
$zipFile = Join-Path $env:TEMP "vips-dev-w64-$kind-$VipsVersion.zip"
$extractedBin = Join-Path $installRoot "vips-dev-$VipsVersion\bin"
$vipsExe = Join-Path $extractedBin "vips.exe"

function Test-VipsReady {
    return (Test-Path $vipsExe)
}

function Save-FileFast {
    param([string] $Uri, [string] $OutPath)

    if ((Test-Path $OutPath) -and -not $Force) {
        Write-Host "Using cached zip: $OutPath" -ForegroundColor DarkGray
        return
    }

    Write-Host "Downloading libvips ($kind, v$VipsVersion)..." -ForegroundColor Cyan
    Write-Host "  $Uri" -ForegroundColor DarkGray

    # 1) BITS — often faster / resumable on Windows desktop & server
    try {
        if (Get-Command Start-BitsTransfer -ErrorAction SilentlyContinue) {
            if (Test-Path $OutPath) { Remove-Item -LiteralPath $OutPath -Force }
            Start-BitsTransfer -Source $Uri -Destination $OutPath -DisplayName "libvips" -Priority High -ErrorAction Stop
            return
        }
    } catch {
        Write-Host "BITS failed, trying curl... ($($_.Exception.Message))" -ForegroundColor Yellow
    }

    # 2) curl.exe — good speed, retries (ships with Windows 10+)
    $curl = Get-Command curl.exe -ErrorAction SilentlyContinue
    if ($curl) {
        & curl.exe -fL --retry 3 --retry-delay 1 -o $OutPath $Uri
        if ($LASTEXITCODE -ne 0) { throw "curl download failed (exit $LASTEXITCODE)" }
        return
    }

    # 3) IWR fallback
    Invoke-WebRequest -Uri $Uri -OutFile $OutPath -UseBasicParsing
}

if (!(Test-Path $installRoot)) {
    New-Item -ItemType Directory -Force -Path $installRoot | Out-Null
}

if (-not $Force -and (Test-VipsReady)) {
    Write-Host "libvips already present: $vipsExe" -ForegroundColor Green
    Write-Host "Run with -Force to re-download and reinstall." -ForegroundColor DarkGray
    # Still ensure PATH contains bin (e.g. after manual copy)
} else {
    Save-FileFast -Uri $url -OutPath $zipFile

    Write-Host "Extracting..." -ForegroundColor Cyan
    Expand-Archive -Path $zipFile -DestinationPath $installRoot -Force

    if (Test-Path $zipFile) {
        Remove-Item -LiteralPath $zipFile -Force -ErrorAction SilentlyContinue
    }
}

if (-not (Test-VipsReady)) {
    throw "Expected vips.exe not found at $vipsExe. Check VipsVersion or extraction path."
}

# Add bin to User PATH (idempotent)
$currentPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($currentPath -notlike "*$extractedBin*") {
    $newPath = if ($currentPath) { "$currentPath;$extractedBin" } else { $extractedBin }
    [Environment]::SetEnvironmentVariable("Path", $newPath, "User")
    $env:Path = "$env:Path;$extractedBin"
    Write-Host "Added to user PATH: $extractedBin" -ForegroundColor Green
} else {
    Write-Host "PATH already contains libvips bin." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Done. Open a new terminal and run:  vips --version" -ForegroundColor Green
