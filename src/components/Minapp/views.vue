<template xmlns:v-contextmenu="http://www.w3.org/1999/xhtml">
  <div>
    <div>
      <div style="margin-left: 20px; margin-top: 10px; display: inline-block; letter-spacing: 1px; margin-bottom: 5px">
      <span @click="handler(1)">
        <span v-if="change == 1" class="hover-tip" data-tooltip="应用"
              style="font-size: 18px; color: #0EAA10;  text-decoration: underline;  ">应用</span>
        <span class="hover-tip" data-tooltip="应用" v-else style="font-size: 18px;  ">应用</span>
      </span>

        <span @click="handler(2)">
          <span v-if="change == 2" class="hover-tip" data-tooltip="详情"
                style="font-size: 18px; color: #0EAA10; text-decoration: underline">详情</span>
          <span class="hover-tip" data-tooltip="详情" v-else style="font-size: 18px">详情</span>
        </span>
      </div>

      <div style="padding: 5px">
        <el-input v-model="value"  prefix-icon="el-icon-search" clearable placeholder="搜索"/>
      </div>

      <div :v-loading="loading" element-loading-spinner="el-icon-loading">
        <div v-show="change == 1">
          <app @openiframe="openiframe" :menu="menu"/>
        </div>
        <div v-show="change == 2">
          敬请期待
        </div>
      </div>
    </div>


  </div>
</template>

<script>
  import App from './app'
  import {minappAllApp} from "../api/minapp";
  import {userappApi} from "../api/userapp";
  import {getToken, getToken2} from "../../utils/auth";
  export default {
    methods: {
      handler(value) {
        this.change = value;
      },
      openiframe(src) {
        this.$emit("openiframe", src)

      },
    },
    mounted() {
      this.loading = true;
      userappApi(this.$axios, this.EDIT, {user_id: getToken2("user").id}).then(res => {
        this.menu = res.data.data;
        this.loading = false;
      });
    },
    watch: {
      value() {
        if(this.value == "") {
          clearTimeout(this.timer);
          this.timer = setTimeout(() => {
            this.loading = true;
            userappApi(this.$axios, this.EDIT, {user_id:  getToken2("user").id}).then(res => {
              this.menu = res.data.data;
              this.loading = false;
            });
          }, 300);
        } else {
          clearTimeout(this.timer);
          this.timer = setTimeout(() => {
            this.loading = true;
            minappAllApp(this.$axios, this.EDIT, {input: this.value}).then(res => {
              this.menu = res.data.data;
              this.loading = false;
            });
          }, 300);
        }
      }
    },
    components: {
      App
    },
    data() {
      return {
        change: 1,
        value: "",
        timer: null,
        asrc: "http://180.169.75.199:5007/s/",
        menu: [],
        loading: false,
      }
    }
  }
</script>

<style scoped>
  .hover-tip:hover:before {
    content: attr(data-tooltip);
    background-color: #6B6B6B;
    opacity: 0.9;
    color: #fff;
    border-radius: 5px;
    padding: 3px 3px 3px 4px;
    position: absolute;
    top: 45px;
    font-size: 10px;
    z-index: 1000000;
    letter-spacing: 1px;
  }

  .hover-tip:hover:after {
    content: ''

  }
</style>
