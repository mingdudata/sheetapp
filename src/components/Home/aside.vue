<template>
  <div style="height: 100%; width: 100%">
    <el-menu style="height: 100%" default-active="home" class="el-menu-vertical-demo" @open="handleOpen"
             @close="handleClose" background-color="#545c64" text-color="#fff" active-text-color="#ffd04b">
      <heard-image/>
      <el-menu-item style="padding-left: 10px; margin-top: 10px;" index="home">
        <i class="el-icon-folder"></i>
      </el-menu-item>
    </el-menu>
  </div>
</template>

<script>
  import HeardImage from '../Login/heardimage'

  export default {
    components: {
      HeardImage
    },
    methods: {
      handleOpen(key, keyPath) {
        console.log(key, keyPath);
      },
      handleClose(key, keyPath) {
        console.log(key, keyPath);
      }
    }
  }
</script>

<style scoped>

</style>
