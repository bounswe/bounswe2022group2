<template>
  <n-config-provider :theme="darkTheme">
    <n-global-style />
    <h1> Hello world </h1>

  </n-config-provider>
</template>


<script>

import { defineComponent } from 'vue'
import { NConfigProvider, NGlobalStyle, darkTheme } from 'naive-ui'



export default defineComponent({
  components: {
    NConfigProvider,
    NGlobalStyle
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