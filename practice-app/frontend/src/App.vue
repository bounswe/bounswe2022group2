<template>
  <n-config-provider :theme="darkTheme">
    <n-global-style />
    <n-message-provider>
      <n-notification-provider>
        <n-dialog-provider>
          <div class="topnav">
            <router-link v-if="authenticated" to="/category">Categories</router-link>
            <router-link v-if="authenticated" to="/rating">Ratings</router-link>
            <router-link v-if="authenticated" to="/create-event">Create Event</router-link>
            <router-link v-if="authenticated" to="/attend">Attend Event</router-link>
            <router-link v-if="authenticated" to="/attended-events">Attended Events</router-link>
            <router-link v-if="authenticated" to="/enrolled-lessons">Enrolled Lessons</router-link>
          </div>
          <router-view @authenticated="setAuthenticated" />
        </n-dialog-provider>
      </n-notification-provider>
    </n-message-provider>
  </n-config-provider>
</template>


<script>
import { darkTheme, NConfigProvider, NDialogProvider, NGlobalStyle, NMessageProvider, NNotificationProvider } from 'naive-ui'
import { defineComponent } from 'vue'
import { RouterLink, RouterView } from 'vue-router'
export default defineComponent({
  name: 'App',
  data() {
    return {
      authenticated: false
    }
  },
  methods: {
    setAuthenticated(status) {
      this.authenticated = status;
    },
  },
  components: {
    NConfigProvider,
    NGlobalStyle,
    RouterLink,
    RouterView,
    NMessageProvider,
    NDialogProvider,
    NNotificationProvider
  },
  setup() {
    return {
      darkTheme
    }
  },
  created() {
    localStorage.setItem('authenticated', false);
    this.authenticated = localStorage.getItem('authenticated');
  },
})
</script>

<style>
.topnav {
  background-color: #333;
  overflow: hidden;
}
/* Style the links inside the navigation bar */
.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}
</style>
