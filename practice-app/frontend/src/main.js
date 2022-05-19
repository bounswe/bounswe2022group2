import { createApp } from 'vue'
import App from './App.vue'
import router from './route.js'
// import store from './store/index.js'

const app = createApp(App)

app.use(router).mount('#app')
