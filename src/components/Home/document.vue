<template>
  <div style="height: 100%">
    <el-row class="tac" style="height: 100%; width: 100%">
      <el-col style="height: 100%" :span="4">
        <el-scrollbar class="el-cala" style="height: 100%">
          <el-menu default-active="1" class="el-menu-vertical-demo" @open="handleOpen" @close="handleClose">
            <el-menu-item index="2">
              <i class="el-icon-menu"></i>
              <span slot="title">导航二</span>
            </el-menu-item>
            <el-menu-item index="3">
              <i class="el-icon-document"></i>
              <span slot="title">
                 <el-row class="tac" style="height: 100%; width: 100%; display: inline-block; min-width: 300px">
                  <el-col style="height: 100%" :span="18">
                     <span>导航三</span>
                  </el-col>
                   <el-col style="height: 100%" :span="4">
                     <span>18:20</span>
                  </el-col>
                 </el-row>
              </span>
            </el-menu-item>
          </el-menu>
        </el-scrollbar>
      </el-col>
      <el-col :span="20" style="position: absolute; left: 280px;">
      </el-col>
    </el-row>
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
