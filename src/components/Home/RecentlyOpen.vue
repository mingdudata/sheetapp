<template>
  <div style=" background: #FBFBFB">
    <div v-if="type == 1">
      <el-menu :default-active="index" router active-text-color="rgb(14, 170, 16)" class="el-menu-vertical-demo"
               background-color="#FBFBFB" @select="handleOpen" @close="handleClose">
        <div v-for="(item, index) in data">
          <el-menu-item v-if="item.type !== 2" :index="'/home' + item.path">
            <div @contextmenu.prevent="rightShow(item)">
              <i class="el-icon-document"></i>
              <span slot="title"
                    style="width: 60%; overflow: hidden; text-overflow:ellipsis; white-space: nowrap; display: inline-block">{{item.alias }} </span>
              <div style="display: inline-block; position: absolute; right: 20px ; ">
            <span style="position: relative; top: 1px; font-size: 12px; color: rgb(169, 169, 169);  ">
              {{item.date}}
            </span>
              </div>
            </div>
          </el-menu-item>
        </div>
      </el-menu>
    </div>
    <!--    todo 重复代码 需要合并-->
    <div v-else :id="type + 'sss'">
      <el-menu :default-active="index" router active-text-color="rgb(14, 170, 16)" class="el-menu-vertical-demo"
               background-color="#FBFBFB" @select="handleOpen" @close="handleClose">
        <div v-for="(item, index) in data">
          <el-menu-item v-if="item.type !== 2" :index="'/home' + item.path">
            <div @contextmenu.prevent="rightShow(item)">
              <i class="el-icon-document"></i>
              <span slot="title"
                    style="width: 60%; overflow: hidden; text-overflow:ellipsis; white-space: nowrap; display: inline-block">{{item.alias }} </span>
              <div style="display: inline-block; position: absolute; right: 20px ; ">
            <span style="position: relative; top: 1px; font-size: 12px; color: rgb(169, 169, 169);  ">
              {{item.date}}
          </span>
              </div>
            </div>
          </el-menu-item>
        </div>
      </el-menu>
    </div>

  </div>
</template>

<script>
  import {mapGetters, mapMutations} from 'vuex'
  import {getToken} from "../../utils/auth";
  import {openFileRecentlyApi} from "../api/folder";

  export default {
    methods: {
      ...mapMutations({
        setActiveIndex: "SET_ACTIVE_INDEX",
        setEntity: "SET_ENTITY"
      }),
      rightShow(entity) {
        console.log("34", entity)

        this.setEntity(entity);
      },
      handleOpen(key, keyPath) {
        let keyData = null;
        Object.keys(this.data).forEach(i => {
          if ('/home' + this.data[i].path == key) {
            keyData = this.data[i];
          }
        });
        if (keyData == null)
          return;

        let args = {
          user_id: getToken(),
          file_id: "/home" + keyData.path
        };
        console.log("26", keyData, key)

        setTimeout(() => {
          openFileRecentlyApi(this.$axios, this.EDIT, args).then(() => {
            this.setActiveIndex(key);
          });
        }, 0)
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
        index: "",
        load: false,
        type: 1,
        timer: null
      }
    },
    watch: {
      data() {
        this.type = this.type == "1" ? 2 : "1"
        console.log("80")
      },
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
      this.load = false;
      this.index = this.active_index;
      setTimeout(() => {
        this.load = true;
      })
      // this.$emit('getData', '')
    }
  }
</script>

<style>

</style>
