<template>
  <div style="height: 100%; width: 100%">
    <el-menu style="height: 100%" default-active="home" class="el-menu-vertical-demo" @select="handleOpen"
             @close="handleClose" background-color="#181A17" text-color="#fff" active-text-color="#0EAA10">
      <heard-image/>
      <el-menu-item style="padding-left: 12px; margin-top: 30px;" index="home">
        <i class="el-icon-edit-outline" style="font-size: 38px"></i>
      </el-menu-item>
      <el-menu-item style="padding-left: 13px; margin-top: 1px;" index="home2">
        <i class="el-icon-s-shop" style="font-size: 38px"></i>
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
        if(key == 'home2') {
          this.$router.push({path: '/home'})
          this.$emit("changeType", 2)
        } else {
          this.$router.push({path: '/home'})
          this.$emit("changeType", 1)
        }
      },
      handleClose(key, keyPath) {
        console.log(key, keyPath);
      }
    }
  }
</script>

<style scoped>

</style>
