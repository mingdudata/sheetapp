<template>
  <div style="margin-top: 5px; background: #FBFBFB">
    <el-menu :default-active="activeIndex" @select="openapp" class="el-menu-vertical-demo"
             background-color="#FBFBFB">
      <div v-for="item in menu">
        <el-menu-item :index="item.id + ''">
          <img :src="item.app_headimage" style=" height: 24px; width: 24px"/><span style="position: relative; top: 1px; margin-left: 5px;">{{item.app_name}}</span>
        </el-menu-item>
      </div>
    </el-menu>
  </div>
</template>


<script>
  import {insertUserappApi} from "../api/userapp";
  import {getToken2} from "../../utils/auth";

  export default {
    props: ["menu"],
    data() {
      return {
        activeIndex: "1",
      }
    },
    mounted() {
      if (this.menu.length > 0) {
        this.activeIndex = this.menu[0].id + '';
        console.log(this.menu, "26")
      }
    },
    methods: {
      findApp(key) {
        for (let item in this.menu) {
          if (this.menu[item].id == key) {
            return this.menu[item];
          }
        }
        return null;
      },
      openapp(key, index) {
        let item = this.findApp(key);
        this.$emit("openiframe", item.app_url);

        insertUserappApi(this.$axios, this.EDIT, {user_id: JSON.parse(getToken2("user")).id, app_id: item.id});
      }
    }
  }
</script>

<style>

</style>
