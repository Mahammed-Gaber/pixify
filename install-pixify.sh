#!/bin/bash
VERSION="1.0.0"
OS_TYPE="$(uname -s | tr '[:upper:]' '[:lower:]')"
ARCH_TYPE="$(uname -m)"
BINARY_NAME="pixify-pro"

# تحديد الملف المناسب بناءً على النظام والمعالج
if [ "$OS_TYPE" == "darwin" ]; then
    PLATFORM="darwin"
    [ "$ARCH_TYPE" == "x86_64" ] && ARCH="amd64" || ARCH="arm64"
elif [ "$OS_TYPE" == "linux" ]; then
    PLATFORM="linux"
    ARCH="amd64" # أو حسب المتاح عندك
else
    echo "❌ Unsupported OS"; exit 1
fi

URL="https://github.com/Mahammed-Gaber/pixify/releases/download/v$VERSION/pixify-pro-$PLATFORM-$ARCH.tar.gz"

echo "📥 Downloading Pixify Pro for $PLATFORM ($ARCH)..."
curl -L $URL -o pixify.tar.gz

echo "📦 Extracting..."
tar -xzf pixify.tar.gz
chmod +x $BINARY_NAME

# التثبيت في مسار متاح
sudo mv $BINARY_NAME /usr/local/bin/
rm pixify.tar.gz

echo "✅ Installed successfully! Run '$BINARY_NAME --version'"