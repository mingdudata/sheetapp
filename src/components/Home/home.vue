<template>
  <div style="height: 100%; width: 100%;" id="home">
    <el-row style="height: 100%; ">
      <el-col style="height: 100%; width: 68px; " :span="1">
        <Aside @changeType="changeType"/>
      </el-col>
      <el-col :style="my_style" :span="23">
        <div style="height: 100%" v-if="type == 1">
          <Index />
        </div>
        <div  style="height: 100%" v-else-if="type == 2">
          <min-app />
        </div>
      </el-col>
    </el-row>
  </div>
</template>

<script>
  import Content from './content'
  import Aside from './aside'
  import Index from './index'
  import MinApp from '../Minapp/minapp'
  export default {
    name: "home",
    mounted() {
      console.log(document.body.clientWidth);
    },
    components: {
      Content,
      Aside,
      Index,
      MinApp
    },
    methods: {
      changeType(v) {
        this.type = v;
      }
    },
    data() {
      return {
        my_style: {
          // width: '0px',
          height: '100%',
          position: 'absolute',
          left: '68px'
        },
        type: 1
      }
    }
  }
</script>

<style scoped>

</style>
