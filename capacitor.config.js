const config = {
  appId: 'com.digitalclock.app',
  appName: 'Digital Clock',
  webDir: 'dist',
  server: {
    androidScheme: 'https'
  },
  plugins: {
    StatusBar: {
      style: 'DARK',
      backgroundColor: '#000000',
      overlaysWebView: false
    },
    Keyboard: {
      resize: 'body',
      style: 'dark'
    }
  },
  android: {
    allowMixedContent: true,
    webContentsDebuggingEnabled: true,
    minWebViewVersion: 60
  },
  ios: {
    contentInset: 'automatic',
    scrollEnabled: false,
    allowsLinkPreview: false
  }
};

module.exports = config;