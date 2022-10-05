require('./bootstrap');
import { createApp } from 'vue'
import Home from './components/Home'

const app = createApp({})

app.component('welcome', Home)

app.mount('#app')