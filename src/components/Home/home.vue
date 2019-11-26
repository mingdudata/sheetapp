<template>
  <div style="height: 100%; width: 100%;" id="home">
    <el-row :style="style">
      <el-col style="height: 100%; width: 68px; " :span="1">
        <Aside @changeType="changeType"/>
      </el-col>
      <el-col :style="my_style" :span="23">
        <div style="height: 100%" v-if="panneId == 1">
          <file-explore />
        </div>
        <div  style="height: 100%" v-else-if="panneId == 2">
          <min-app />
        </div>
      </el-col>
    </el-row>
  </div>
</template>

<script>
  import Aside from './aside'
  import FileExplore from './fileExplore'
  import MinApp from '../Minapp/minapp'
  export default {
    name: "home",
    mounted() {
    this.style.width = document.body.clientWidth + "px";
    this.my_style.width = document.body.clientWidth - 68 + "px";
      console.log(document.body.clientWidth);
      window.onresize = () => {
          console.log("...")
          window.screenWidth = document.body.clientWidth;
          this.screenWidth =  window.screenWidth;
      }
    },
    watch: {
      screenWidth(val) {
        console.log(39)
        this.screenWidth = val;
        this.style.width = val + "px";
        this.my_style.width = val - 68 + "px";
      }
    },
    components: {
      Aside,
      FileExplore,
      MinApp
    },
    methods: {
      changeType(v) {
        this.panneId = v;
      }
    },
    data() {
      return {
      style: {
         height: '100%',
         width:  0 + "px",
      },
      screenWidth: document.body.clientWidth,
        my_style: {
          width: document.body.clientWidth,
          height: '100%',
          position: 'absolute',
          left: '68px',
          top: '0px'
        },
        panneId: 1
      }
    }
  }
</script>

<style scoped>

</style>
