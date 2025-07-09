#!/bin/bash

echo "🚀 Building Digital Clock APK..."

# Build the web app
echo "📦 Building web application..."
npm run build

# Sync with Capacitor
echo "🔄 Syncing with Capacitor..."
npx cap sync

# Build the APK
echo "🔨 Building Android APK..."
cd android
./gradlew assembleDebug

echo "✅ APK built successfully!"
echo "📱 APK location: android/app/build/outputs/apk/debug/app-debug.apk"
echo ""
echo "To install on your phone:"
echo "1. Transfer the APK to your phone"
echo "2. Enable 'Install from Unknown Sources' in Settings"
echo "3. Tap the APK file to install"
echo ""
echo "Or use ADB: adb install app/build/outputs/apk/debug/app-debug.apk"