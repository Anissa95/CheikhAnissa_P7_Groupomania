<template>
  <div id="app">
    <router-view />
  </div>
</template>

<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
body {
  height: 100%;
  margin: 0;
  background: url(./assets/image_fond.jpg) no-repeat 50% 0% fixed;
  width: 100%;
  background-size: cover;
}
</style>
