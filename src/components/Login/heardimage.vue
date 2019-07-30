<template>
  <div>
    <div class="demo-basic--circle" style="text-align: center; margin-top: 30px">
      <el-popover @hide="deletedom" placement="left-end" width="200" trigger="click"
                  content="这是一段内容,这是一段内容,这是一段内容,这是一段内容。">
        <div>
          <div style="height: 50px">
            <span
              style="display: inline-block; margin-top: 10px; font-weight: bold; font-size: 20px">{{username}}</span>
            <img :src="squareUrl" style="width: 50px ; height: 50px; float: right; "/>
          </div>
          <el-divider></el-divider>
          <i @click="logout" style="font-size: 32px; float: right; display: inline-block; margin-right: 10px"
             class="el-icon-top"/>
        </div>
        <el-avatar slot="reference" shape="square" :size="'large'" :src="squareUrl"></el-avatar>
      </el-popover>
    </div>
  </div>
</template>

<script>
  import {getToken, getToken2, removeToken, removeToken2} from "../../utils/auth";

  export default {
    data() {
      return {
        circleUrl: "https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png",
        squareUrl: "https://cube.elemecdn.com/9/c2/f0ee8a3c7c9638a54940382568c9dpng.png",
        sizeList: ["small"],
        username: getToken(),
      }
    },
    mounted() {
      let user = getToken2("user");

      if (user) {
        this.squareUrl = user.headimgurl ? user.headimgurl : "https://cube.elemecdn.com/9/c2/f0ee8a3c7c9638a54940382568c9dpng.png";
      }
    },
    methods: {
      clickavatar() {
        console.log("20...")
      },
      deletedom() {
      },
      logout() {
        removeToken();
        removeToken2('user');
        this.$router.push({path: '/login'})
      }
    },

  }
</script>

<style scoped>

</style>
