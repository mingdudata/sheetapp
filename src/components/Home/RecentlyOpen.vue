<template>
  <div style="margin-top: 5px">
    <el-menu router :default-active="index" class="el-menu-vertical-demo" @select="handleOpen" @close="handleClose">
      <div v-for="(item, index) in data">
        <el-menu-item  :index="'/home' + item.path">
          <i class="el-icon-document"></i>
          <span slot="title" style="  width: 72%;overflow: hidden;text-overflow:ellipsis;white-space: nowrap; display: inline-block">{{item.alias}}</span>
          <div style="display: inline-block; position: absolute; right: 20px ; ">
            <span style="position: relative; top: 5px; font-size: 12px; color: rgb(169, 169, 169);  ">
           {{item.sheet_date}}
          </span>
          </div>
        </el-menu-item>
      </div>
    </el-menu>
  </div>
</template>

<script>
  import {mapGetters, mapMutations} from 'vuex'
  import {getToken} from "../../utils/auth";
  import {openFileRecentlyApi} from "../api/folder";

  export default {
    methods: {
      ...mapMutations({
        setActiveIndex: "SET_ACTIVE_INDEX"
      }),
      handleOpen(key, keyPath) {
        let keyData = null;
        Object.keys(this.data).forEach(i => {
          if('/home' + this.data[i].path == key) {
            keyData = this.data[i];
          }
        });
        if (keyData == null)
          return;

        let args = {
          user_id: getToken(),
          file_id: keyData.file_id
        };
        console.log("26", keyData, key)

        openFileRecentlyApi(this.$axios, this.EDIT, args).then(() => {
          this.setActiveIndex(key);
        });
        // this.$emit('getData', 1)
      },
      handleClose(key, keyPath) {
        console.log(key, keyPath);
      }
    },
    props: ["data"],
    computed: {
      ...mapGetters([
        'active_index',
      ])
    },
    data() {
      return {
        index: ""
      }
    },
    watch: {
      $route(to, from) {
        this.setActiveIndex(to.path);
        this.index = to.path;
      },
      active_index: {
        handler(v) {
          this.setActiveIndex(this.index);
        },
        deep: true
      }
    },
    mounted() {
      this.index = this.active_index;
      this.$emit('getData', '')
    }
  }
</script>

<style>

</style>
