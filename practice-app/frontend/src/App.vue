<template>
  <n-config-provider :theme="darkTheme">
    <n-global-style />
    <div class="topnav">
      <router-link to="/">mock1</router-link>
      <router-link to="/b">mock2</router-link>
      <router-link to="/category">Categories</router-link>
    </div>

      <router-view />

  </n-config-provider>
</template>


<script>

import { defineComponent } from 'vue'
import { NConfigProvider, NGlobalStyle, darkTheme } from 'naive-ui'
import { RouterView, RouterLink } from 'vue-router'



export default defineComponent({
  components: {
    NConfigProvider,
    NGlobalStyle,
    RouterLink,
    RouterView
  },
  setup() {
    return {
      darkTheme
    }
  }
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