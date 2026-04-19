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

# Resolved after extract (or on re-run when already installed)
$script:extractedBin = $null
$script:vipsExe = $null

function Find-VipsExe {
    param([string]$Root)
    if (-not (Test-Path -LiteralPath $Root)) { return $null }
    # Official zips use a top-level folder like vips-dev-8.18 (not vips-dev-8.18.0) — search for bin\vips.exe
    Get-ChildItem -LiteralPath $Root -Recurse -Filter "vips.exe" -ErrorAction SilentlyContinue | Select-Object -First 1
}

function Save-FileFast {
    param([string] $Uri, [string] $OutPath)

    if ((Test-Path $OutPath) -and -not $Force) {
        Write-Host "Using cached zip: $OutPath" -ForegroundColor DarkGray
        return
    }

    Write-Host "Downloading libvips ($kind, v$VipsVersion)..." -ForegroundColor Cyan
    Write-Host "  $Uri" -ForegroundColor DarkGray

    try {
        if (Get-Command Start-BitsTransfer -ErrorAction SilentlyContinue) {
            if (Test-Path $OutPath) { Remove-Item -LiteralPath $OutPath -Force }
            Start-BitsTransfer -Source $Uri -Destination $OutPath -DisplayName "libvips" -Priority High -ErrorAction Stop
            return
        }
    } catch {
        Write-Host "BITS failed, trying curl... ($($_.Exception.Message))" -ForegroundColor Yellow
    }

    $curl = Get-Command curl.exe -ErrorAction SilentlyContinue
    if ($curl) {
        & curl.exe -fL --retry 3 --retry-delay 1 -o $OutPath $Uri
        if ($LASTEXITCODE -ne 0) { throw "curl download failed (exit $LASTEXITCODE)" }
        return
    }

    Invoke-WebRequest -Uri $Uri -OutFile $OutPath -UseBasicParsing
}

if (!(Test-Path $installRoot)) {
    New-Item -ItemType Directory -Force -Path $installRoot | Out-Null
}

$existing = Find-VipsExe $installRoot
if ($existing -and -not $Force) {
    $script:extractedBin = $existing.DirectoryName
    $script:vipsExe = $existing.FullName
    Write-Host "libvips already present: $($script:vipsExe)" -ForegroundColor Green
    Write-Host "Run with -Force to re-download and reinstall." -ForegroundColor DarkGray
} else {
    Save-FileFast -Uri $url -OutPath $zipFile

    Write-Host "Extracting..." -ForegroundColor Cyan
    Expand-Archive -Path $zipFile -DestinationPath $installRoot -Force

    if (Test-Path $zipFile) {
        Remove-Item -LiteralPath $zipFile -Force -ErrorAction SilentlyContinue
    }

    $found = Find-VipsExe $installRoot
    if (-not $found) {
        throw @"
Expected vips.exe not found under: $installRoot
The zip may have a different folder layout than older scripts expected (e.g. vips-dev-8.18 vs vips-dev-8.18.0).
If the folder exists, check that ...\bin\vips.exe is present. Re-run with -Force after clearing $installRoot
"@
    }
    $script:extractedBin = $found.DirectoryName
    $script:vipsExe = $found.FullName
}

# Add bin to User PATH (idempotent)
$currentPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($currentPath -notlike "*$($script:extractedBin)*") {
    $newPath = if ($currentPath) { "$currentPath;$($script:extractedBin)" } else { $script:extractedBin }
    [Environment]::SetEnvironmentVariable("Path", $newPath, "User")
    $env:Path = "$env:Path;$($script:extractedBin)"
    Write-Host "Added to user PATH: $($script:extractedBin)" -ForegroundColor Green
} else {
    Write-Host "PATH already contains libvips bin." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Done. Open a new terminal and run:  vips --version" -ForegroundColor Green
