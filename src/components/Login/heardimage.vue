<template>
  <div>
    <div class="demo-basic--circle" style="text-align: center; margin-top: 20px" @click="clickavatar">
      <el-popover placement="left-end" width="200" trigger="click" content="这是一段内容,这是一段内容,这是一段内容,这是一段内容。">
        <div>
          <div style="height: 50px">
            <span style="display: inline-block; margin-top: 10px; font-weight: bold; font-size: 20px">{{username}}</span>
            <img :src="squareUrl" style="width: 50px ; height: 50px; float: right; "/>
          </div>
          <el-divider></el-divider>

          <i @click="logout" style="font-size: 32px; float: right; display: inline-block; margin-right: 10px" class="el-icon-top"/>
        </div>
        <el-avatar slot="reference" shape="square" size="small" :src="squareUrl"></el-avatar>
      </el-popover>
    </div>
  </div>
</template>

<script>
  import {getToken} from "../../utils/auth";
  import {removeToken} from "../../utils/auth";

  export default {
    data() {
      return {
        circleUrl: "https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png",
        squareUrl: "https://cube.elemecdn.com/9/c2/f0ee8a3c7c9638a54940382568c9dpng.png",
        sizeList: ["small"],
        username: getToken(),
      }
    },
    methods: {
      clickavatar() {
        removeToken();
        console.log("20...")
      },
      logout() {
        this.$router.push({path: '/login'})
      }
    },

  }
</script>

<style scoped>

</style>
