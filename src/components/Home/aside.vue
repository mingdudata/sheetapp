<template>
  <div style="height: 100%; width: 100%">
    <el-menu router default-active="home" class="el-menu-vertical-demo" @open="handleOpen" @close="handleClose" background-color="#545c64" text-color="#fff" active-text-color="#ffd04b">
      <el-menu-item style="padding-left: 10px; margin-top: 60px;" index="document">
        <i class="el-icon-document"></i>
      </el-menu-item>
      <el-menu-item  style="padding-left: 10px"  index="home">
        <i class="el-icon-folder"></i>
      </el-menu-item>
    </el-menu>
  </div>
</template>

<script>
  export default {
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
