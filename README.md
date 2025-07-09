# Digital Clock Mobile App

A full-screen digital clock mobile app for **Android** and **iOS** built with Vue.js 3 and Capacitor. Features a beautiful dark mode interface with glowing green text and responsive design.

## Features

- ⏰ **Full-screen digital clock** with hours, minutes, and seconds
- 🌙 **Dark mode** with a sleek black background
- 📱 **Mobile-optimized** responsive design for iOS and Android
- 🔄 **Toggle between 12/24 hour format** (tap anywhere on screen)
- 💚 **Glowing green text** with retro digital aesthetic
- 📅 **Current date and day display**
- 🔒 **Screen stays on** while app is active
- 📱 **Fullscreen immersive mode** on Android
- 🍎 **Native iOS support** with proper safe area handling

## Platform Support

- ✅ **Android** (API 24+)
- ✅ **iOS** (iOS 12.0+)
- ✅ **Web browsers** (development)

## Prerequisites

### For Both Platforms
1. **Node.js** (v18 or higher)

### For Android Development
2. **Android Studio** with SDK tools
3. **Java Development Kit (JDK)** (v8 or higher)

### For iOS Development (macOS only)
4. **Xcode 15.0+** (from Mac App Store)
5. **Xcode Command Line Tools**
6. **Apple Developer Account** (for device deployment)

## Quick Start

### 1. Install Dependencies

```bash
npm install
```

### 2. Build the Web App

```bash
npm run build
```

## Platform Setup

### Android Setup

#### Initialize Android Platform (first time only)
```bash
npx cap add android
```

#### Build and Deploy Android
```bash
# Method 1: Using build script (recommended)
chmod +x build-apk.sh
./build-apk.sh

# Method 2: Manual steps
npm run build
npx cap sync android
npx cap open android
```

### iOS Setup (macOS only)

#### Initialize iOS Platform (first time only)
```bash
# Automated setup (recommended)
chmod +x setup-ios.sh
./setup-ios.sh

# Manual setup
npm install @capacitor/ios
npx cap add ios
npm run build
npx cap sync ios
```

#### Build and Deploy iOS
```bash
# Method 1: Using build script (recommended)
./build-ios.sh

# Method 2: Manual steps
npm run build
npx cap sync ios
npx cap open ios
```

## Deployment Guides

### 📱 Android Deployment
See [DEPLOYMENT_GUIDE.md](./DEPLOYMENT_GUIDE.md) for detailed Android instructions.

### 🍎 iOS Deployment
See [IOS_DEPLOYMENT_GUIDE.md](./IOS_DEPLOYMENT_GUIDE.md) for comprehensive iOS instructions including:
- Simulator setup
- Device deployment
- App Store submission
- Troubleshooting

## Running on Devices

### Android Device

1. **Enable Developer Options** on your Android device:
   - Go to Settings > About Phone
   - Tap "Build Number" 7 times
   - Go back to Settings > Developer Options
   - Enable "USB Debugging"

2. **Connect your phone** to your computer via USB

3. **Deploy the app**:
   ```bash
   ./build-apk.sh  # Opens Android Studio
   ```

4. **Select your device** and click Run in Android Studio

### iOS Device (macOS only)

1. **Connect your iOS device** via USB

2. **Deploy the app**:
   ```bash
   ./build-ios.sh  # Opens Xcode
   ```

3. **In Xcode**:
   - Select your development team
   - Choose your connected device
   - Click the Play button

4. **Trust the developer** on your device (Settings > General > VPN & Device Management)

### iOS Simulator

```bash
# Run on any available simulator
npm run build:ios

# Run on specific simulator
npx cap run ios --target="iPhone 15"

# List available simulators
xcrun simctl list devices
```

## Development

### Run in Development Mode

```bash
npm run dev
```

Access the app at `http://localhost:3000` in your browser.

### Available Scripts

```bash
# Development
npm run dev                 # Start development server
npm run build              # Build for production

# Android
npm run android            # Run on Android device/emulator
npm run build:android      # Build and run Android
npm run cap:open           # Open Android Studio

# iOS (macOS only)
npm run ios                # Run on iOS simulator
npm run build:ios          # Build and run iOS
npm run cap:open:ios       # Open Xcode

# General
npm run cap:sync           # Sync web assets to native platforms
```

## App Features

### Time Display
- Large, easy-to-read digital clock
- Responsive font sizing for different screen sizes
- Glowing green text effect for retro aesthetic

### Cross-Platform Features
- **Android**: Fullscreen immersive mode, keeps screen on
- **iOS**: Proper safe area handling, dark status bar
- **Both**: Touch interactions, responsive design

### Interaction
- **Tap anywhere** to toggle between 12-hour and 24-hour format
- Hint message appears for 5 seconds on first launch

## Configuration

### Capacitor Config
The app is configured for both platforms in `capacitor.config.js`:

```javascript
const config = {
  appId: 'com.digitalclock.app',
  appName: 'Digital Clock',
  android: {
    allowMixedContent: true,
    webContentsDebuggingEnabled: true
  },
  ios: {
    contentInset: 'automatic',
    scrollEnabled: false,
    allowsLinkPreview: false
  }
};
```

## Troubleshooting

### Android Issues
- **Gradle build fails**: Ensure correct Java version (JDK 8+)
- **Device not detected**: Enable USB debugging and install drivers
- **App crashes**: Check Android logs in Android Studio

### iOS Issues (macOS only)
- **Build errors**: Clean derived data and rebuild
- **Signing issues**: Verify Apple Developer account and team selection
- **Device not recognized**: Check device connection and trust computer
- **Web content issues**: Use Safari Web Inspector for debugging

### General Issues
- **Dependencies**: Run `npm install` to ensure all packages are installed
- **Sync issues**: Run `npx cap sync` to update native projects
- **Cache issues**: Clear browser cache or restart development server

## Project Structure

```
digital-clock-app/
├── src/                          # Vue.js source code
│   ├── components/
│   │   └── DigitalClock.vue     # Main clock component
│   ├── App.vue                  # Root component
│   └── main.js                  # Entry point
├── android/                     # Android platform files
├── ios/                         # iOS platform files (after setup)
├── build-apk.sh                 # Android build script
├── build-ios.sh                 # iOS build script
├── setup-ios.sh                 # iOS setup automation
├── capacitor.config.js          # Capacitor configuration
├── DEPLOYMENT_GUIDE.md          # Android deployment guide
└── IOS_DEPLOYMENT_GUIDE.md      # iOS deployment guide
```

## Customization

### Changing Colors
Edit `src/components/DigitalClock.vue`:
```css
color: #00ff41; /* Change to your preferred color */
text-shadow: 0 0 20px #00ff41; /* Matching glow effect */
```

### Adding Features
Built with Vue 3 Composition API for easy extension:
- Alarms and timers
- Multiple time zones
- Custom themes
- Weather integration
- Stopwatch functionality

## Publishing

### Android (Google Play Store)
1. Generate signed APK in Android Studio
2. Upload to Google Play Console
3. Complete store listing and submit for review

### iOS (App Store)
1. Archive in Xcode (Product > Archive)
2. Upload to App Store Connect
3. Complete app information and submit for review

## License

MIT License - feel free to modify and distribute as needed.

## Support

For detailed platform-specific instructions:
- **Android**: [DEPLOYMENT_GUIDE.md](./DEPLOYMENT_GUIDE.md)
- **iOS**: [IOS_DEPLOYMENT_GUIDE.md](./IOS_DEPLOYMENT_GUIDE.md)

For general support:
- [Capacitor Documentation](https://capacitorjs.com/docs)
- [Vue.js Documentation](https://vuejs.org/)
- [Android Developer Documentation](https://developer.android.com/)
- [Apple Developer Documentation](https://developer.apple.com/documentation/)
