<template>
  <div class="app">
    <DigitalClock />
  </div>
</template>

<script>
import DigitalClock from './components/DigitalClock.vue'
import { onMounted } from 'vue'

export default {
  name: 'App',
  components: {
    DigitalClock
  },
  setup() {
    onMounted(() => {
      // Prevent screen from sleeping
      if ('wakeLock' in navigator) {
        navigator.wakeLock.request('screen').catch(() => {
          console.log('Wake lock not supported')
        })
      }
      
      // Set full screen
      if (document.documentElement.requestFullscreen) {
        document.addEventListener('click', () => {
          if (!document.fullscreenElement) {
            document.documentElement.requestFullscreen().catch(() => {
              console.log('Fullscreen not supported')
            })
          }
        }, { once: true })
      }
    })
  }
}
</script>

<style scoped>
.app {
  height: 100vh;
  width: 100vw;
  display: flex;
  align-items: center;
  justify-content: center;
  background: #000000;
  overflow: hidden;
}
</style>