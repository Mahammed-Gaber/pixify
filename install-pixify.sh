#!/usr/bin/env bash
# install-pixify.sh — installs Pixify Free or Pro on macOS / Linux
#
# Usage:
#   # Free (latest):
#   curl -fsSL https://raw.githubusercontent.com/Mahammed-Gaber/pixify/main/install-pixify.sh | bash
#
#   # Pro (latest):
#   curl -fsSL https://raw.githubusercontent.com/Mahammed-Gaber/pixify/main/install-pixify.sh | bash -s -- --edition pro
#
#   # Specific version, skip PATH patching (e.g. CI):
#   bash install-pixify.sh --edition pro --version 1.2.0 --no-path
#
# Options:
#   --edition  free|pro     Which edition to install (default: free)
#   --version  x.y.z        Specific version; default: latest from GitHub
#   --force                 Re-install even if same version already present
#   --no-path               Skip writing PATH to shell rc files
#   -h, --help              Show this help
#
# Install location:
#   ~/.pixify/pixify-{edition}/  (binary at root of that folder)
#
# macOS note:
#   Homebrew is the recommended method on macOS (handles updates automatically):
#     brew install mahammed-gaber/pixify/pixify-free
#     brew install mahammed-gaber/pixify/pixify-pro
#   This script does a manual install if Homebrew is not available or you prefer it.

set -euo pipefail

# ── defaults ──────────────────────────────────────────────────────────────────
EDITION="free"
VERSION=""
FORCE=0
PATCH_PATH=1

# ── parse args ────────────────────────────────────────────────────────────────
while [[ $# -gt 0 ]]; do
    case "$1" in
        --edition|-e)
            EDITION="${2,,}"
            shift 2 ;;
        --version|-v)
            VERSION="$2"
            shift 2 ;;
        --force|-f)
            FORCE=1
            shift ;;
        --no-path)
            PATCH_PATH=0
            shift ;;
        -h|--help)
            sed -n '3,27p' "$0" | sed 's/^# \?//'
            exit 0 ;;
        *)
            echo "Unknown option: $1" >&2
            exit 1 ;;
    esac
done

if [[ "$EDITION" != "free" && "$EDITION" != "pro" ]]; then
    echo "Error: --edition must be 'free' or 'pro'" >&2
    exit 1
fi

# Capitalise first letter for display
EDITION_CAP="$(echo "${EDITION:0:1}" | tr '[:lower:]' '[:upper:]')${EDITION:1}"
BINARY="pixify-$EDITION"
INSTALL_DIR="$HOME/.pixify/pixify-$EDITION"
VERSION_FILE="$INSTALL_DIR/.version"

# ── detect OS / arch ──────────────────────────────────────────────────────────
OS="$(uname -s | tr '[:upper:]' '[:lower:]')"
ARCH_RAW="$(uname -m)"

case "$ARCH_RAW" in
    x86_64)          ARCH="amd64" ;;
    arm64|aarch64)   ARCH="arm64" ;;
    *) echo "Unsupported architecture: $ARCH_RAW" >&2; exit 1 ;;
esac

case "$OS" in
    darwin) PLATFORM="darwin" ;;
    linux)  PLATFORM="linux"  ;;
    *) echo "Unsupported OS: $OS" >&2; exit 1 ;;
esac

# Linux arm64 note (only amd64 builds published as of v1.0.0)
if [[ "$PLATFORM" == "linux" && "$ARCH" == "arm64" ]]; then
    echo "Warning: Linux arm64 is not yet in published releases. Falling back to amd64." >&2
    ARCH="amd64"
fi

# ── macOS Homebrew hint ───────────────────────────────────────────────────────
if [[ "$PLATFORM" == "darwin" ]] && command -v brew &>/dev/null; then
    echo ""
    echo "💡 Homebrew detected — recommended on macOS for automatic updates:"
    echo "     brew install mahammed-gaber/pixify/$BINARY"
    echo ""
    echo "   Continuing with manual install (run the brew command above instead if you prefer)."
    echo ""
fi

# ── helper: portable download ─────────────────────────────────────────────────
download() {
    local url="$1" dest="$2"
    if command -v curl &>/dev/null; then
        curl -fL --retry 3 --retry-delay 1 -o "$dest" "$url"
    elif command -v wget &>/dev/null; then
        wget -q --tries=3 -O "$dest" "$url"
    else
        echo "Error: neither curl nor wget found." >&2
        exit 1
    fi
}

# ── 1. Resolve version ────────────────────────────────────────────────────────
if [[ -z "$VERSION" ]]; then
    echo "Fetching latest Pixify $EDITION_CAP version from GitHub..."
    API_JSON="$(download "https://api.github.com/repos/Mahammed-Gaber/pixify/releases/latest" /dev/stdout 2>/dev/null || true)"
    VERSION="$(echo "$API_JSON" | grep '"tag_name"' | head -1 | sed 's/.*"v\([^"]*\)".*/\1/')"
    if [[ -z "$VERSION" ]]; then
        echo "Error: could not fetch latest version from GitHub API." >&2
        exit 1
    fi
    echo "  Latest: v$VERSION"
fi

TARBALL="pixify-$EDITION-$PLATFORM-$ARCH.tar.gz"
URL="https://github.com/Mahammed-Gaber/pixify/releases/download/v$VERSION/$TARBALL"

# ── 2. Skip if same version already installed ─────────────────────────────────
if [[ -x "$INSTALL_DIR/$BINARY" && $FORCE -eq 0 ]]; then
    INSTALLED_VER="$(cat "$VERSION_FILE" 2>/dev/null || echo "unknown")"
    if [[ "$INSTALLED_VER" == "$VERSION" ]]; then
        echo ""
        echo "Pixify $EDITION_CAP v$VERSION is already installed: $INSTALL_DIR/$BINARY"
        echo "Run with --force to reinstall, or --version x.y.z for a different version."
        exit 0
    fi
    echo "Installed: v$INSTALLED_VER — upgrading to v$VERSION..."
fi

# ── 3. Download ───────────────────────────────────────────────────────────────
TMP_TAR="$(mktemp /tmp/pixify.XXXXXX.tar.gz)"
trap 'rm -f "$TMP_TAR"' EXIT

echo ""
echo "Downloading Pixify $EDITION_CAP v$VERSION ($PLATFORM/$ARCH)..."
echo "  $URL"
download "$URL" "$TMP_TAR"

# ── 4. Extract ────────────────────────────────────────────────────────────────
echo "Extracting to $INSTALL_DIR..."
mkdir -p "$INSTALL_DIR"
tar -xzf "$TMP_TAR" -C "$INSTALL_DIR"

# ── 5. Locate binary (don't assume root position) ─────────────────────────────
BINARY_PATH="$(find "$INSTALL_DIR" -name "$BINARY" -type f | head -1)"
if [[ -z "$BINARY_PATH" ]]; then
    echo "Error: '$BINARY' not found in $INSTALL_DIR after extraction." >&2
    exit 1
fi
chmod +x "$BINARY_PATH"
BIN_DIR="$(dirname "$BINARY_PATH")"

# ── 6. Save installed version ─────────────────────────────────────────────────
echo "$VERSION" > "$VERSION_FILE"

# ── 7. Patch shell rc files (idempotent) ─────────────────────────────────────
if [[ $PATCH_PATH -eq 1 ]]; then
    EXPORT_LINE="export PATH=\"$BIN_DIR:\$PATH\""
    ADDED=0
    for RC in "$HOME/.bashrc" "$HOME/.zshrc" "$HOME/.profile"; do
        if [[ -f "$RC" ]] && ! grep -qF "$BIN_DIR" "$RC" 2>/dev/null; then
            printf '\n# Pixify %s\n%s\n' "$EDITION_CAP" "$EXPORT_LINE" >> "$RC"
            echo "  Added to $RC"
            ADDED=1
        fi
    done
    # Also apply to current session
    export PATH="$BIN_DIR:$PATH"
    if [[ $ADDED -eq 0 ]]; then
        echo "  PATH already contains $BIN_DIR (no rc files updated)"
    fi
fi

# ── Done ──────────────────────────────────────────────────────────────────────
echo ""
echo "Done! Open a new terminal and run:"
echo "  $BINARY --version"
echo "  $BINARY --help"
if [[ "$EDITION" == "pro" ]]; then
    echo ""
    echo "⚠️  Pro license required — activate at: https://getpixify.com/pricing"
fi
