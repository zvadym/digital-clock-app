#!/bin/bash

echo "🍎 Building Digital Clock iOS App..."

# Clean and build web assets
echo "📦 Building web assets..."
npm run build

# Sync Capacitor
echo "🔄 Syncing Capacitor..."
npx cap sync ios

# Open Xcode project
echo "📱 Opening Xcode project..."
npx cap open ios

echo "✅ iOS build process complete!"
echo ""
echo "📋 Next steps:"
echo "1. In Xcode, select your development team in the project settings"
echo "2. Connect your iOS device or use the iOS Simulator"
echo "3. Click the play button to build and run the app"
echo ""
echo "For device deployment:"
echo "- Make sure your device is connected via USB"
echo "- Trust the developer certificate on your device"
echo "- Enable Developer Mode in Settings > Privacy & Security"