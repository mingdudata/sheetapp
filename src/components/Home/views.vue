<template xmlns:v-contextmenu="http://www.w3.org/1999/xhtml">
  <div>
    <div>
      <div style="margin-left: 20px; margin-top: 10px; display: inline-block; letter-spacing: 5px">
      <span @click="handler(1)">
        <span v-if="change2 == 1" style="font-size: 26px; color: #0EAA10"><i class="el-icon-tickets"></i></span>
        <span class="hover-tip" data-tooltip="打开最近" v-else style="font-size: 26px;  ">
          <i class="el-icon-document"></i></span>
      </span>
        <span @click="handler(2)">
        <span v-if="change2 == 2" style="font-size: 26px; color: #0EAA10">
          <i class="el-icon-folder-opened"></i>
        </span>
        <span class="hover-tip" data-tooltip="打开目录" v-else style="font-size: 26px">
          <i class="el-icon-folder"></i>
        </span>
      </span>
      </div>

      <div>
        <search @setLabel="setLabel" @setChange="setChange" @getData2="getData2" @opensearchpane="handler"
                @getData="getData" @setData="setData"/>
      </div>
    </div>

    <div style="min-height: 100px" element-loading-spinner="el-icon-loading">
      <div v-show="change == 1">
        <div v-contextmenu:contextmenu>
          <recently-open :data="data" @getData="getData" @opensearchpane="handler"/>
          <v-contextmenu ref="contextmenu">
            <v-contextmenu-item @click="renameFile">修改名称</v-contextmenu-item>
            <v-contextmenu-item @click="removeFile">删除</v-contextmenu-item>
          </v-contextmenu>
        </div>
      </div>
      <div v-show="change == 2">
        <div v-contextmenu:contextmenu>
          <el-menu background-color="#FBFBFB" active-text-color="rgb(14, 170, 16)" router :default-active="index"
                   @select="open">
            <nav-menu :navMenus="menuData"/>
          </el-menu>
          <v-contextmenu ref="contextmenu">
            <v-contextmenu-item @click="renameFile">修改名称</v-contextmenu-item>
            <v-contextmenu-item @click="removeFile">删除</v-contextmenu-item>
          </v-contextmenu>
        </div>
      </div>
    </div>

    <div>
      <el-dialog title="修改名称" :visible.sync="centerDialogVisible" width="40%" center>
        <span>
          <el-input placeholder="请输入内容" v-model="input" clearable></el-input>
        </span>
        <span slot="footer" class="dialog-footer">
        <el-button @click="centerDialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="changeFileName">确 定</el-button>
        </span>
      </el-dialog>
    </div>
  </div>
</template>

<script>
  import NavMenu from "./NavMenu.vue";
  import RecentlyOpen from "./RecentlyOpen"
  import Search from './search'
  import SearchOpen from './SearchOpen'
  import {
    changeFileNameApi,
    getOpenFileApi,
    getOpenFileRecentlyApi,
    openFileRecentlyApi,
    removeFileApi
  } from "../api/folder";
  import {getToken2} from "../../utils/auth";
  import {mapGetters, mapMutations} from 'vuex'

  export default {
    name: "views",
    components: {
      NavMenu,
      RecentlyOpen,
      Search,
      SearchOpen
    },
    data() {
      return {
        change: 1,
        change2: 1,
        label_change: 1,
        data: [],
        loading: false,
        index: "",
        centerDialogVisible: false,
        input: "",
      }
    },
    watch: {
      $route(to, from) {
        console.log(to, "43", from);
        this.setActiveIndex(to.path);
        this.index = to.path;
      },
      menuData() {
        console.log("94...")
        this.getData("");
      }
    },
    computed: {
      ...mapGetters([
        'active_index',
        'entity',
        'menuData'
      ])
    },
    mounted() {
      this.index = this.active_index;
    },
    methods: {
      ...mapMutations({
        setActiveIndex: "SET_ACTIVE_INDEX",
      }),
      changeFileName() {
        if (this.input == "") {
          this.$message({
            message: '文件名不能为空',
            type: 'warning'
          });
          return;
        }
        changeFileNameApi(this.$axios, this.EDIT, {_id: this.entity.id, name: this.input}).then(res => {
          console.log("116", res.data)
          if (res.data == "fail") {
            this.$message({message: '该文件已经存在了哦~', type: 'error', showClose: true});
            this.centerDialogVisible = false;
            return;
          }
          this.$message({message: '修改名称成功', type: 'success', showClose: true});
          this.centerDialogVisible = false;
          this.$emit("loadCatalogueData");
        });
      },
      removeFile() {
        let args = {
          user_id: getToken2('user').id,
          file_id: this.entity.file_id || "/home" + this.entity.path,
          _id: this.entity.id,
          type: this.entity.type,
          path: this.entity.parent
        };
        console.log(args, "92")
        removeFileApi(this.$axios, this.EDIT, args).then(res => {
          this.$message({message: '删除成功', type: 'success', showClose: true});
          this.$emit("loadCatalogueData");
        });
      },
      renameFile() {
        this.centerDialogVisible = true;
        this.input = this.entity.alias;
        console.log(this.entity, "92")
      },
      getEntity(entity) {
        console.log("96", entity)
        this.entity = entity;
      },
      handler(value) {
        if (value == 1) {
          this.getData("")
        }
        this.change2 = value;
        this.change = value;
      },
      setChange(value) {
        this.label_change = this.change;
      },
      setLabel(value) {
        console.log("139", value, this.change, this.label_change)
        if (value == 1) {
          this.change = value;
        } else {
          if (this.label_change == 1) {
            this.getData("");
          } else {
            this.change = 2;
          }
        }
      },
      setData(v) {
        this.data = [];
      },
      open(index, indexPath) {
        // 最近一次点击 插入数据库
        let args = {
          user_id: getToken2('user').id,
          file_id: index
        };
        this.index = index;
        openFileRecentlyApi(this.$axios, this.EDIT, args);
      },
      getData(fileName = "") {

        // this.change2 = 2;
        let loadTimer = setTimeout(() => {
          this.loading = true;
        }, 50);
        getOpenFileRecentlyApi(this.$axios, this.EDIT, {
          user_id: getToken2('user').id,
          file_name: fileName
        }).then(res => {
          this.data = res.data.data;
          if (this.data.length)
            this.setActiveIndex('/home' + this.data[0].path);
          clearTimeout(loadTimer);
          this.loading = false;
        }).catch(err => {
          this.loading = false;
          clearTimeout(loadTimer);
        });
      },
      getData2(fileName = "") {
        this.data = {}
        this.setLabel(1);
        let loadTimer = setTimeout(() => {
          this.loading = true;
        }, 50);
        getOpenFileApi(this.$axios, this.EDIT, {user_id: getToken2('user').id, file_name: fileName}).then(res => {
          this.data = res.data.data;
          if (this.data.length)
            this.setActiveIndex('/home' + this.data[0].path);
          clearTimeout(loadTimer);
          this.loading = false;
        }).catch(err => {
          this.loading = false;
          clearTimeout(loadTimer);
        });
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
