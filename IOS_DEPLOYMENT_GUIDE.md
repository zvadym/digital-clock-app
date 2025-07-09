# iOS Deployment Guide - Digital Clock App

This guide provides complete instructions for setting up, building, and deploying the Digital Clock app on iOS devices and simulators.

## Prerequisites

### Required Software
1. **macOS** (iOS development requires macOS)
2. **Xcode 15.0+** (Download from Mac App Store)
3. **Node.js 18+** (Download from nodejs.org)
4. **Ruby 2.7.0+** (The system Ruby on macOS is often outdated. It's recommended to use a version manager like `rbenv` to install a newer version.)
   - **Install `rbenv` and a modern Ruby version:**
     ```bash
     # 1. Install rbenv
     brew install rbenv ruby-build
     # 2. Add rbenv to zsh
     echo 'eval "$(rbenv init -)"' >> ~/.zshrc
     # 3. Restart your shell/terminal
     # 4. Install Ruby and set it as global
     rbenv install 3.1.4
     rbenv global 3.1.4
     ```
5. **Xcode Command Line Tools**
   ```bash
   xcode-select --install
   ```
6. **CocoaPods**
   ```bash
   sudo gem install cocoapods
   ```

### Apple Developer Account
- **For Simulator**: No Apple Developer account needed
- **For Physical Device**: Apple Developer account required ($99/year)

## Initial Setup

### 1. Install iOS Dependencies
```bash
# Install iOS Capacitor plugin
npm install @capacitor/ios

# Add iOS platform to your project
npx cap add ios
```

### 2. Build and Sync
```bash
# Build the web assets
npm run build

# Sync with iOS platform
npx cap sync ios
```

## Development Methods

### Method 1: Using Build Script (Recommended)
```bash
# Make sure script is executable
chmod +x build-ios.sh

# Run the build script
./build-ios.sh
```

### Method 2: Manual Commands
```bash
# Build web assets
npm run build

# Sync Capacitor
npx cap sync ios

# Open Xcode project
npx cap open ios
```

### Method 3: Direct Run (Simulator Only)
```bash
# Build and run directly on simulator
npm run build:ios
```

## Running on iOS Simulator

### 1. Using Xcode
1. Run `./build-ios.sh` or `npx cap open ios`
2. In Xcode, select a simulator from the device dropdown (e.g., "iPhone 15")
3. Click the **Play** button (▶️) or press `Cmd+R`
4. The simulator will launch and install your app

### 2. Using Command Line
```bash
# List available simulators
xcrun simctl list devices

# Run on specific simulator
npx cap run ios --target="iPhone 15"

# Run on any available simulator
npx cap run ios
```

### Simulator Troubleshooting
- **App doesn't appear**: Check if the build succeeded in Xcode
- **White screen**: Check the browser console in Safari Web Inspector
- **Simulator won't start**: Restart Xcode and try again

## Running on Physical iOS Device

### 1. Prerequisites for Device Deployment
- Apple Developer account (paid)
- iOS device with iOS 12.0+
- USB cable to connect device to Mac
- Device registered in Apple Developer Portal

### 2. Xcode Configuration
1. Open the project in Xcode: `npx cap open ios`
2. Select your project in the navigator
3. Under "Signing & Capabilities":
   - Select your development team
   - Ensure "Automatically manage signing" is checked
   - Verify the bundle identifier matches your app ID

### 3. Device Setup
1. Connect your iOS device via USB
2. Trust the computer on your device when prompted
3. Enable Developer Mode:
   - iOS 16+: Settings > Privacy & Security > Developer Mode
   - Toggle Developer Mode ON and restart device

### 4. Deploy to Device
1. In Xcode, select your connected device from the device dropdown
2. Click the **Play** button (▶️) or press `Cmd+R`
3. The app will build and install on your device

### 5. Trust Developer Certificate (First Time)
1. On your device, go to Settings > General > VPN & Device Management
2. Find your developer certificate
3. Tap "Trust [Your Developer Name]"
4. Confirm by tapping "Trust"

## Configuration Files

### Capacitor Config (`capacitor.config.js`)
```javascript
const config = {
  appId: 'com.digitalclock.app',
  appName: 'Digital Clock',
  webDir: 'dist',
  ios: {
    contentInset: 'automatic',
    scrollEnabled: false,
    allowsLinkPreview: false,
    scheme: 'Digital Clock'
  }
  // ... other config
};
```

### Package.json Scripts
```json
{
  "scripts": {
    "ios": "cap run ios",
    "build:ios": "npm run build && cap sync && cap run ios",
    "cap:open:ios": "cap open ios"
  }
}
```

## App Store Deployment

### 1. Prepare for Release
```bash
# Clean build
npm run build

# Sync changes
npx cap sync ios

# Open Xcode
npx cap open ios
```

### 2. Archive in Xcode
1. In Xcode, select "Any iOS Device" or your connected device
2. Go to Product > Archive
3. Wait for the archive to complete
4. The Organizer window will open

### 3. Upload to App Store Connect
1. In Organizer, select your archive
2. Click "Distribute App"
3. Choose "App Store Connect"
4. Follow the prompts to upload

### 4. Submit for Review
1. Go to App Store Connect (appstoreconnect.apple.com)
2. Complete app information, screenshots, etc.
3. Submit for review

## Troubleshooting

### Common Issues

#### Build Errors
```bash
# Clean derived data
rm -rf ~/Library/Developer/Xcode/DerivedData

# Clean Capacitor
npx cap clean ios
npx cap sync ios
```

#### Signing Issues
- Ensure you have a valid Apple Developer account
- Check that your bundle identifier is unique
- Verify your development team is selected in Xcode

#### Device Not Recognized
```bash
# Reset device connection
xcrun devicectl list devices
```

#### Web Content Issues
- Enable Web Inspector in Safari: Develop > [Your Device] > [Your App]
- Check console for JavaScript errors
- Verify all assets are loading correctly

### Performance Optimization
1. **Status Bar**: Configured for dark content
2. **Keyboard**: Set to dark style to match app theme
3. **Content Inset**: Automatic for proper safe area handling
4. **Scroll**: Disabled to prevent unwanted scrolling

## File Structure After iOS Setup
```
digital-clock-app/
├── ios/                          # iOS-specific files
│   ├── App/
│   │   ├── App/
│   │   │   ├── AppDelegate.swift
│   │   │   ├── SceneDelegate.swift
│   │   │   └── Info.plist
│   │   └── App.xcodeproj
│   └── Podfile
├── build-ios.sh                  # iOS build script
├── capacitor.config.js           # Updated with iOS config
└── package.json                  # Updated with iOS dependencies
```

## Quick Commands Reference

```bash
# Setup
npm install @capacitor/ios
npx cap add ios

# Development
./build-ios.sh                    # Build and open Xcode
npm run build:ios                 # Build and run on simulator
npx cap run ios --target="iPhone 15"  # Run on specific simulator

# Maintenance
npx cap sync ios                  # Sync web assets to iOS
npx cap clean ios                 # Clean iOS build
npx cap copy ios                  # Copy web assets only
```

## Support

For additional help:
- [Capacitor iOS Documentation](https://capacitorjs.com/docs/ios)
- [Apple Developer Documentation](https://developer.apple.com/documentation/)
- [Xcode Help](https://developer.apple.com/xcode/)

---

*Last updated: $(date)*