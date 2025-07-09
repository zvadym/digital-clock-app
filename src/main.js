import { createApp } from 'vue'
import './style.css'
import App from './App.vue'

// Capacitor imports
import { Capacitor } from '@capacitor/core'
import { StatusBar, Style } from '@capacitor/status-bar'

const app = createApp(App)

app.mount('#app')

// Configure status bar for mobile
if (Capacitor.isNativePlatform()) {
  StatusBar.setStyle({ style: Style.Dark })
  StatusBar.setBackgroundColor({ color: '#000000' })
  StatusBar.hide()
}