# Digital Clock Mobile App

A full-screen digital clock mobile app for Android built with Vue.js 3 and Capacitor. Features a beautiful dark mode interface with glowing green text and responsive design.

## Features

- ⏰ **Full-screen digital clock** with hours, minutes, and seconds
- 🌙 **Dark mode** with a sleek black background
- 📱 **Mobile-optimized** responsive design
- 🔄 **Toggle between 12/24 hour format** (tap anywhere on screen)
- 💚 **Glowing green text** with retro digital aesthetic
- 📅 **Current date and day display**
- 🔒 **Screen stays on** while app is active
- 📱 **Fullscreen immersive mode** on Android

## Prerequisites

Before building the app, ensure you have:

1. **Node.js** (v16 or higher)
2. **Android Studio** with SDK tools
3. **Java Development Kit (JDK)** (v8 or higher)

## Quick Start

### 1. Install Dependencies

```bash
npm install
```

### 2. Build the Web App

```bash
npm run build
```

### 3. Initialize Capacitor (first time only)

```bash
npx cap add android
```

### 4. Sync and Build for Android

```bash
npm run cap:sync
```

### 5. Open in Android Studio

```bash
npm run cap:open
```

This will open Android Studio where you can build and run the app on your device.

## Deployment to Your Phone

### Method 1: Using Android Studio (Recommended)

1. **Enable Developer Options** on your Android device:
   - Go to Settings > About Phone
   - Tap "Build Number" 7 times
   - Go back to Settings > Developer Options
   - Enable "USB Debugging"

2. **Connect your phone** to your computer via USB

3. **Open the project** in Android Studio:
   ```bash
   npm run cap:open
   ```

4. **Select your device** from the device dropdown in Android Studio

5. **Click the Run button** (green play icon) to install and launch the app

### Method 2: Build APK for Manual Installation

1. **Build the APK**:
   ```bash
   cd android
   ./gradlew assembleDebug
   ```

2. **Find the APK** at:
   ```
   android/app/build/outputs/apk/debug/app-debug.apk
   ```

3. **Transfer the APK** to your phone via:
   - USB cable
   - Email
   - Cloud storage (Google Drive, Dropbox, etc.)
   - ADB: `adb install app-debug.apk`

4. **Install the APK** on your phone:
   - Enable "Install from Unknown Sources" in Settings
   - Tap the APK file and follow installation prompts

### Method 3: Using ADB (Command Line)

1. **Install ADB** (Android Debug Bridge)
2. **Enable USB Debugging** on your phone
3. **Connect your phone** and run:
   ```bash
   npm run build
   npx cap sync
   cd android
   ./gradlew assembleDebug
   adb install app/build/outputs/apk/debug/app-debug.apk
   ```

## Development

### Run in Development Mode

```bash
npm run dev
```

Access the app at `http://localhost:3000` in your browser.

### Live Reload on Device

1. Start the dev server:
   ```bash
   npm run dev
   ```

2. Update `capacitor.config.js` to point to your local server:
   ```javascript
   server: {
     url: 'http://YOUR_IP:3000',
     cleartext: true
   }
   ```

3. Sync and run:
   ```bash
   npx cap sync
   npx cap run android
   ```

## Build Scripts

- `npm run dev` - Start development server
- `npm run build` - Build for production
- `npm run cap:sync` - Sync web assets to native platforms
- `npm run cap:open` - Open in Android Studio
- `npm run build:android` - Build and sync, then open Android Studio

## App Features

### Time Display
- Large, easy-to-read digital clock
- Responsive font sizing for different screen sizes
- Glowing green text effect for retro aesthetic

### Interaction
- **Tap anywhere** to toggle between 12-hour and 24-hour format
- Hint message appears for 5 seconds on first launch

### Mobile Optimizations
- Fullscreen immersive mode
- Screen stays on while app is active
- Responsive design for portrait and landscape orientations
- Touch-optimized interface

## Troubleshooting

### Common Issues

1. **Gradle build fails**: Ensure you have the correct Java version (JDK 8+)
2. **Device not detected**: Check USB debugging is enabled and drivers are installed
3. **App crashes on launch**: Check Android logs in Android Studio
4. **Black screen**: Ensure all dependencies are installed correctly

### Android Studio Issues

If Android Studio doesn't detect your device:
1. Check USB debugging is enabled
2. Install appropriate USB drivers for your device
3. Try different USB ports/cables
4. Restart ADB: `adb kill-server && adb start-server`

## Customization

### Changing Colors
Edit `src/components/DigitalClock.vue` and modify the CSS:
```css
color: #00ff41; /* Change this to your preferred color */
```

### Adding Features
The app is built with Vue 3 Composition API, making it easy to add new features like:
- Alarms
- Timezones
- Custom themes
- Weather display

## License

MIT License - feel free to modify and distribute as needed.

## Support

For issues or questions, check the troubleshooting section above or consult the Capacitor documentation at https://capacitorjs.com/
