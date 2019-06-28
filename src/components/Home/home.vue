<template>
  <div style="height: 100%; width: 100%" id="home">
    <el-row style="height: 100%; " >
      <el-col style="height: 100%; "  :span="1">
        <Aside />
      </el-col>
      <el-col style="height: 100%; "   :span="23">
        <Content/>
      </el-col>
    </el-row>
  </div>
</template>

<script>
  import Content from './content'
  import Aside from './aside'

  export default {
    components: {
      Content,
      Aside
    }
  }
</script>

<style scoped>

</style>
