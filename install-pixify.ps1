#Requires -Version 5.1
<#
.SYNOPSIS
  Installs Pixify Free or Pixify Pro on Windows (64-bit).

.DESCRIPTION
  - Auto-detects the latest release from GitHub unless -Version is specified.
  - Installs under: $env:USERPROFILE\.pixify\pixify-{edition}\
  - Skips reinstall if the requested version is already present (override with -Force).
  - Also installs libvips automatically via install-vips.ps1 unless -SkipVips.

  Download methods (in order of priority):
    1. BITS (Start-BitsTransfer)  — resumable, fast on Windows
    2. curl.exe (Windows 10+)     — good throughput, supports retries
    3. Invoke-WebRequest          — fallback

.PARAMETER Edition
  Which edition to install: Free or Pro (default: Free).

.PARAMETER Version
  A specific version to install, e.g. "1.2.0". Default: latest from GitHub.

.PARAMETER Force
  Re-download and reinstall even if the same version is already installed.

.PARAMETER SkipVips
  Skip the libvips installation step (useful if vips is already on PATH).

.EXAMPLE
  # Install Free (latest) — simplest one-liner:
  irm https://raw.githubusercontent.com/Mahammed-Gaber/pixify/main/install-pixify.ps1 | iex

.EXAMPLE
  # Install Pro (latest) — same style as Free; env var because iex cannot pass -Edition:
  $env:PIXIFY_EDITION = 'Pro'; irm https://raw.githubusercontent.com/Mahammed-Gaber/pixify/main/install-pixify.ps1 | iex
  # OR — same pattern; PIXIFY_EDITION because `| iex` cannot pass -Edition Pro
  & ([scriptblock]::Create((irm 'https://raw.githubusercontent.com/Mahammed-Gaber/pixify/main/install-pixify.ps1'))) -Edition Pro

.EXAMPLE
  # Save locally then run with flags:
  irm https://raw.githubusercontent.com/Mahammed-Gaber/pixify/main/install-pixify.ps1 -OutFile "$env:TEMP\install-pixify.ps1"
  & "$env:TEMP\install-pixify.ps1" -Edition Pro -Version 1.2.0 -SkipVips
#>

param(
    [ValidateSet("Free", "Pro")]
    [string] $Edition = "Free",
    [string] $Version = "",
    [switch] $Force,
    [switch] $SkipVips
)

# `irm ... | iex` cannot pass -Edition; use PIXIFY_EDITION=Pro|Free as a one-shot prefix:
#   $env:PIXIFY_EDITION = 'Pro'; irm ... | iex
# The variable is consumed and cleared immediately so it won't affect the next run.
if (-not $PSBoundParameters.ContainsKey('Edition') -and $env:PIXIFY_EDITION) {
    $raw = $env:PIXIFY_EDITION.Trim()
    if ($raw -match '^(?i)pro$') { $Edition = 'Pro' }
    elseif ($raw -match '^(?i)free$') { $Edition = 'Free' }
}
# Clear after reading so the variable doesn't leak into subsequent runs in the same session.
Remove-Item Env:\PIXIFY_EDITION -ErrorAction SilentlyContinue

$ErrorActionPreference = "Stop"

# TLS 1.2 for older PowerShell / some hosts
try { [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 } catch { }

$editionLower = $Edition.ToLower()
$exeName      = "pixify-$editionLower.exe"
$installRoot  = Join-Path $env:USERPROFILE ".pixify\pixify-$editionLower"
$versionFile  = Join-Path $installRoot ".version"

# ── helpers ───────────────────────────────────────────────────────────────────

function Find-PixifyExe {
    param([string]$Root)
    if (-not (Test-Path -LiteralPath $Root)) { return $null }
    Get-ChildItem -LiteralPath $Root -Recurse -Filter $exeName -ErrorAction SilentlyContinue |
        Select-Object -First 1
}

function Save-FileFast {
    param([string]$Uri, [string]$OutPath)

    if ((Test-Path $OutPath) -and -not $Force) {
        Write-Host "  Using cached zip: $OutPath" -ForegroundColor DarkGray
        return
    }

    try {
        if (Get-Command Start-BitsTransfer -ErrorAction SilentlyContinue) {
            if (Test-Path $OutPath) { Remove-Item -LiteralPath $OutPath -Force }
            Start-BitsTransfer -Source $Uri -Destination $OutPath `
                -DisplayName "Pixify $Edition" -Priority High -ErrorAction Stop
            return
        }
    } catch {
        Write-Host "  BITS failed, trying curl... ($($_.Exception.Message))" -ForegroundColor Yellow
    }

    $curl = Get-Command curl.exe -ErrorAction SilentlyContinue
    if ($curl) {
        & curl.exe -fL --retry 3 --retry-delay 1 -o $OutPath $Uri
        if ($LASTEXITCODE -ne 0) { throw "curl download failed (exit $LASTEXITCODE)" }
        return
    }

    Invoke-WebRequest -Uri $Uri -OutFile $OutPath -UseBasicParsing
}

# ── 1. Resolve version ────────────────────────────────────────────────────────
if (-not $Version) {
    Write-Host "Fetching latest Pixify $Edition version from GitHub..." -ForegroundColor Cyan
    try {
        $rel     = Invoke-RestMethod `
            -Uri "https://api.github.com/repos/Mahammed-Gaber/pixify/releases/latest" `
            -UseBasicParsing
        $Version = $rel.tag_name -replace '^v', ''
        Write-Host "  Latest: v$Version" -ForegroundColor DarkGray
    } catch {
        throw "Could not fetch latest release: $($_.Exception.Message)"
    }
}

$zipName = "Pixify-$Edition-Windows-v$Version.zip"
$url     = "https://github.com/Mahammed-Gaber/pixify/releases/download/v$Version/$zipName"
$zipFile = Join-Path $env:TEMP $zipName

# ── 2. Skip if same version already installed ─────────────────────────────────
$existing = Find-PixifyExe $installRoot
if ($existing -and -not $Force) {
    $installedVer = if (Test-Path $versionFile) {
        (Get-Content $versionFile -Raw).Trim()
    } else { "unknown" }

    if ($installedVer -eq $Version) {
        Write-Host ""
        Write-Host "Pixify $Edition v$Version is already installed." -ForegroundColor Green
        Write-Host "  $($existing.FullName)" -ForegroundColor DarkGray
        Write-Host "Run with -Force to reinstall, or -Version x.y.z for a different version." -ForegroundColor DarkGray
        # Use `return` — not `exit` — so the host window stays open (exit closes the whole PowerShell session).
        return
    }
    Write-Host "Installed: v$installedVer — upgrading to v$Version..." -ForegroundColor Yellow
}

# ── 3. libvips ────────────────────────────────────────────────────────────────
if (-not $SkipVips) {
    Write-Host ""
    Write-Host "Checking libvips..." -ForegroundColor Cyan
    $vipsOnPath = Get-Command vips.exe -ErrorAction SilentlyContinue
    if ($vipsOnPath -and -not $Force) {
        Write-Host "  libvips already on PATH: $($vipsOnPath.Source)" -ForegroundColor Green
    } else {
        Write-Host "  Installing libvips via install-vips.ps1..." -ForegroundColor Cyan
        try {
            $vipsScript = Invoke-RestMethod `
                -Uri "https://raw.githubusercontent.com/Mahammed-Gaber/pixify/main/install-vips.ps1" `
                -UseBasicParsing
            $installVips = [scriptblock]::Create($vipsScript)
            & $installVips
        } catch {
            Write-Warning "libvips install failed: $($_.Exception.Message)"
            Write-Host "  Install libvips manually after Pixify completes:" -ForegroundColor Yellow
            Write-Host "  irm https://raw.githubusercontent.com/Mahammed-Gaber/pixify/main/install-vips.ps1 | iex" -ForegroundColor DarkGray
        }
    }
}

# ── 4. Download ───────────────────────────────────────────────────────────────
Write-Host ""
Write-Host "Downloading Pixify $Edition v$Version..." -ForegroundColor Cyan
Write-Host "  $url" -ForegroundColor DarkGray
Save-FileFast -Uri $url -OutPath $zipFile

# ── 5. Extract ────────────────────────────────────────────────────────────────
Write-Host "Extracting to $installRoot..." -ForegroundColor Cyan
if (!(Test-Path $installRoot)) {
    New-Item -ItemType Directory -Force -Path $installRoot | Out-Null
}
Expand-Archive -Path $zipFile -DestinationPath $installRoot -Force
if (Test-Path $zipFile) { Remove-Item -LiteralPath $zipFile -Force -ErrorAction SilentlyContinue }

# ── 6. Locate exe ─────────────────────────────────────────────────────────────
$found = Find-PixifyExe $installRoot
if (-not $found) {
    throw "'$exeName' not found under $installRoot after extraction. Check the release zip contents."
}
$binDir = $found.DirectoryName
Write-Host "  Found: $($found.FullName)" -ForegroundColor DarkGray

# ── 7. Save installed version ─────────────────────────────────────────────────
Set-Content -Path $versionFile -Value $Version -Encoding UTF8

# ── 8. Add to User PATH (idempotent) ──────────────────────────────────────────
$currentPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($currentPath -notlike "*$binDir*") {
    $newPath = if ($currentPath) { "$currentPath;$binDir" } else { $binDir }
    [Environment]::SetEnvironmentVariable("Path", $newPath, "User")
    $env:Path = "$env:Path;$binDir"
    Write-Host "Added to user PATH: $binDir" -ForegroundColor Green
} else {
    Write-Host "PATH already contains: $binDir" -ForegroundColor Yellow
}

# ── Done ──────────────────────────────────────────────────────────────────────
Write-Host ""
Write-Host "Done! Open a new terminal and run:" -ForegroundColor Green
Write-Host "  pixify-$editionLower --version" -ForegroundColor White
Write-Host "  pixify-$editionLower --help" -ForegroundColor White
if ($Edition -eq "Pro") {
    Write-Host ""
    Write-Host "Pro license required — activate at: https://getpixify.com/pricing" -ForegroundColor Yellow
}
