<template>
  <div class="digital-clock">
    <div class="time-display">
      <div class="time">{{ currentTime }}</div>
      <div class="date">{{ currentDate }}</div>
      <div class="day">{{ currentDay }}</div>
    </div>
    
    <!-- Tap anywhere to toggle 12/24 hour format -->
    <div class="tap-hint" v-if="showHint" @click="hideHint">
      Tap to toggle 12/24 hour format
    </div>
  </div>
</template>

<script>
import { ref, onMounted, onUnmounted } from 'vue'

export default {
  name: 'DigitalClock',
  setup() {
    const currentTime = ref('')
    const currentDate = ref('')
    const currentDay = ref('')
    const is24HourFormat = ref(true)
    const showHint = ref(true)
    let timeInterval = null

    const updateTime = () => {
      const now = new Date()
      
      // Format time
      const hours = now.getHours()
      const minutes = now.getMinutes()
      const seconds = now.getSeconds()
      
      if (is24HourFormat.value) {
        currentTime.value = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`
      } else {
        const hours12 = hours % 12 || 12
        const ampm = hours >= 12 ? 'PM' : 'AM'
        currentTime.value = `${hours12.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')} ${ampm}`
      }
      
      // Format date
      const options = { 
        year: 'numeric', 
        month: 'long', 
        day: 'numeric' 
      }
      currentDate.value = now.toLocaleDateString('en-US', options)
      
      // Format day
      const dayOptions = { weekday: 'long' }
      currentDay.value = now.toLocaleDateString('en-US', dayOptions)
    }

    const toggleTimeFormat = () => {
      is24HourFormat.value = !is24HourFormat.value
      updateTime()
    }

    const hideHint = () => {
      showHint.value = false
    }

    onMounted(() => {
      updateTime()
      timeInterval = setInterval(updateTime, 1000)
      
      // Hide hint after 5 seconds
      setTimeout(() => {
        showHint.value = false
      }, 5000)
      
      // Add click listener to toggle format
      document.addEventListener('click', toggleTimeFormat)
    })

    onUnmounted(() => {
      if (timeInterval) {
        clearInterval(timeInterval)
      }
      document.removeEventListener('click', toggleTimeFormat)
    })

    return {
      currentTime,
      currentDate,
      currentDay,
      showHint,
      hideHint
    }
  }
}
</script>

<style scoped>
.digital-clock {
  position: relative;
  height: 100vh;
  width: 100vw;
  display: flex;
  align-items: center;
  justify-content: center;
  background: linear-gradient(135deg, #000000 0%, #111111 50%, #000000 100%);
  cursor: pointer;
  user-select: none;
}

.time-display {
  text-align: center;
  color: #00ff41;
  text-shadow: 0 0 20px #00ff41, 0 0 40px #00ff41, 0 0 60px #00ff41;
  animation: glow 2s infinite alternate;
}

.time {
  font-size: clamp(3rem, 15vw, 8rem);
  font-weight: bold;
  font-family: 'Courier New', 'Monaco', 'Lucida Console', monospace;
  letter-spacing: 0.1em;
  margin-bottom: 1rem;
  line-height: 1;
}

.date {
  font-size: clamp(1rem, 4vw, 2rem);
  font-weight: 300;
  letter-spacing: 0.2em;
  margin-bottom: 0.5rem;
  opacity: 0.8;
}

.day {
  font-size: clamp(0.8rem, 3vw, 1.5rem);
  font-weight: 300;
  letter-spacing: 0.3em;
  text-transform: uppercase;
  opacity: 0.6;
}

.tap-hint {
  position: absolute;
  bottom: 2rem;
  left: 50%;
  transform: translateX(-50%);
  font-size: 0.9rem;
  color: rgba(255, 255, 255, 0.5);
  text-align: center;
  animation: fadeInOut 3s infinite;
  pointer-events: auto;
}

@keyframes glow {
  from {
    text-shadow: 0 0 20px #00ff41, 0 0 30px #00ff41, 0 0 40px #00ff41;
  }
  to {
    text-shadow: 0 0 30px #00ff41, 0 0 40px #00ff41, 0 0 50px #00ff41, 0 0 60px #00ff41;
  }
}

@keyframes fadeInOut {
  0%, 100% { opacity: 0.3; }
  50% { opacity: 0.7; }
}

/* Responsive adjustments for mobile */
@media (max-width: 768px) {
  .time {
    font-size: clamp(2.5rem, 12vw, 6rem);
  }
  
  .date {
    font-size: clamp(0.9rem, 3.5vw, 1.8rem);
  }
  
  .day {
    font-size: clamp(0.7rem, 2.5vw, 1.3rem);
  }
}

/* Landscape orientation adjustments */
@media (orientation: landscape) and (max-height: 500px) {
  .time {
    font-size: clamp(2rem, 8vh, 4rem);
  }
  
  .date {
    font-size: clamp(0.8rem, 2.5vh, 1.5rem);
  }
  
  .day {
    font-size: clamp(0.6rem, 2vh, 1.2rem);
  }
  
  .tap-hint {
    bottom: 1rem;
    font-size: 0.8rem;
  }
}
</style>