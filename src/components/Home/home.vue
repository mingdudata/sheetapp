<template>
  <div style="height: 100%; width: 100%;" id="home">
    <el-row style="height: 100%; ">
      <el-col style="height: 100%; width: 50px; " :span="1">
        <Aside />
      </el-col>
      <el-col :style="my_style" :span="23">
        <Index />
      </el-col>
    </el-row>
  </div>
</template>

<script>
  import Content from './content'
  import Aside from './aside'
  import Index from './index'

  export default {
    mounted() {
      console.log(document.body.clientWidth);
    },
    components: {
      Content,
      Aside,
      Index
    },
    data() {
      return {
        my_style: {
          // width: '0px',
          height: '100%',
          position: 'absolute',
          left: '50px'
        }
      }
    }
  }
</script>

<style scoped>

</style>
