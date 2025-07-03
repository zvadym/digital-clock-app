# Quick Deployment Guide

## 🚀 Get Your Digital Clock App on Your Phone in 3 Steps

### Step 1: Setup (One-time)
```bash
./setup.sh
```

### Step 2: Build APK
```bash
./build-apk.sh
```

### Step 3: Install on Phone
1. **Enable Unknown Sources**: Settings > Security > Install from Unknown Sources
2. **Transfer APK**: Copy `android/app/build/outputs/apk/debug/app-debug.apk` to your phone
3. **Install**: Tap the APK file on your phone and follow prompts

## Alternative: Use Android Studio
```bash
npm run cap:open
```
Then click the "Run" button in Android Studio with your phone connected.

## What You Get
- ⏰ Full-screen digital clock
- 🌙 Beautiful dark mode
- 💚 Glowing green retro text
- 📱 Tap to toggle 12/24 hour format
- 🔒 Screen stays on
- 📅 Date and day display

## Troubleshooting
- **APK won't install**: Enable "Install from Unknown Sources" in Settings
- **Build fails**: Make sure you have Android Studio and Java JDK installed
- **Device not detected**: Enable "USB Debugging" in Developer Options

## Need Help?
Check the detailed README.md file for complete instructions and troubleshooting.