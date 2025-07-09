#!/bin/bash

echo "🍎 Setting up iOS platform for Digital Clock App..."

# Check if we're on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "❌ Error: iOS development requires macOS"
    exit 1
fi

# Check if Xcode is installed
if ! command -v xcodebuild &> /dev/null; then
    echo "❌ Error: Xcode is not installed. Please install Xcode from the Mac App Store."
    exit 1
fi

# Check if Xcode command line tools are installed
if ! xcode-select -p &> /dev/null; then
    echo "📦 Installing Xcode command line tools..."
    xcode-select --install
else
    echo "✅ Xcode command line tools are already installed"
fi

# Check for CocoaPods
if ! command -v pod &> /dev/null; then
    echo "❌ Error: CocoaPods is not installed. Please run 'sudo gem install cocoapods' and try again."
    exit 1
fi

# Install iOS dependencies
echo "📦 Installing iOS Capacitor plugin..."
npm install @capacitor/ios

# Add iOS platform
echo "🔧 Adding iOS platform to project..."
npx cap add ios

# Build web assets
echo "🏗️ Building web assets..."
npm run build

# Sync with iOS platform
echo "🔄 Syncing with iOS platform..."
npx cap sync ios

# Make build script executable
chmod +x build-ios.sh

echo ""
echo "✅ iOS setup complete!"
echo ""
echo "📋 Next steps:"
echo "1. Run './build-ios.sh' to open the project in Xcode"
echo "2. In Xcode, select your development team (if deploying to device)"
echo "3. Choose a simulator or connect your iOS device"
echo "4. Click the play button to build and run"
echo ""
echo "📚 For detailed instructions, see IOS_DEPLOYMENT_GUIDE.md"