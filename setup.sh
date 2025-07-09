#!/bin/bash

echo "🚀 Setting up Digital Clock Mobile App..."

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js v16 or higher."
    exit 1
fi

echo "✅ Node.js found: $(node --version)"

# Install dependencies
echo "📦 Installing dependencies..."
npm install

# Build the web app
echo "🔨 Building web application..."
npm run build

# Initialize Capacitor
echo "⚡ Initializing Capacitor for Android..."
npx cap add android

# Sync the project
echo "🔄 Syncing project..."
npx cap sync

echo ""
echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "1. Make sure you have Android Studio installed"
echo "2. Enable Developer Options and USB Debugging on your phone"
echo "3. Run 'npm run cap:open' to open in Android Studio"
echo "4. Or run './build-apk.sh' to build an APK file"
echo ""
echo "📖 See README.md for detailed instructions"