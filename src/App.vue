<template>
  <div id="app" style="width: 100%; height: 100%;">
    <router-view />
     <!--<home style="height: 100%"/>-->
  </div>
</template>

<script>

  export default {
    provide() {
      return {
        reload: this.reload
      }
    },
    data() {
      return {
        isRouterAlive: true
      }
    },
    methods: {
      reload() {
        this.isRouterAlive = !this.isRouterAlive;
      }
    }
  }
</script>

<style>

  html, body {
    height: 100%;
  }

  #app {
    height: 100%;
  }

  .el-button--primary {
    color: #FFF;
    background-color: #0EAA10;
    border-color: #0EAA10;
  }

  .el-button--primary:hover {
    color: #FFF;
    background-color: #7CCD7C;
    border-color: #7CCD7C;
  }

  .el-button:hover {
    color: #FFF;
    background-color: #7CCD7C;
    border-color: #7CCD7C;
  }
</style>
