<template xmlns:v-contextmenu="http://www.w3.org/1999/xhtml">
  <div>
    <div>
      <div style="margin-left: 20px; margin-top: 10px; display: inline-block; letter-spacing: 5px">
      <span @click="handler(1)">
        <span v-if="change == 1" style="font-size: 26px; color: blue"><i class="el-icon-tickets"></i></span>
        <span class="hover-tip" data-tooltip="打开" v-else style="font-size: 26px;  ">
          <i class="el-icon-document"></i></span>
      </span>
        <span @click="handler(2)">
        <span v-if="change == 2" style="font-size: 26px; color: blue">
          <i class="el-icon-folder-opened"></i>
        </span>
        <span class="hover-tip" data-tooltip="打开" v-else style="font-size: 26px">
          <i class="el-icon-folder"></i>
        </span>
      </span>
      </div>

      <div>
        <search @opensearchpane="handler" @getData="getData" @setData="setData"/>
      </div>
    </div>

    <div style="min-height: 100px" v-loading="loading" element-loading-spinner="el-icon-loading">
      <div v-show="change == 1">
        <recently-open :data="data" @getData="getData" @opensearchpane="handler"/>
      </div>
      <div v-show="change == 2">
        <div v-contextmenu:contextmenu>
          <el-menu router :default-active="index" @select="open">
            <nav-menu :navMenus="menuData"/>
          </el-menu>
          <v-contextmenu ref="contextmenu">
            <!--<v-contextmenu-item @click="removeFile">删除该文件</v-contextmenu-item>-->
            <v-contextmenu-item @click="renameFile">修改名称</v-contextmenu-item>
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
  import {changeFileNameApi, getOpenFileRecentlyApi, openFileRecentlyApi} from "../api/folder";
  import {getToken} from "../../utils/auth";
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
      this.getData("");
    },
    methods: {
      ...mapMutations({
        setActiveIndex: "SET_ACTIVE_INDEX"
      }),
      changeFileName() {
        changeFileNameApi(this.$axios, this.EDIT, {_id: this.entity.id, name: this.input}).then(res => {
          console.log("..")
          this.$message({message: '修改名称成功', type: 'success', showClose: true});
          this.centerDialogVisible = false;
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
        console.log(value, "72")
        this.change = value;
      },
      setData(v) {
        this.data = [];
      },
      open(index, indexPath) {
        // 最近一次点击 插入数据库
        let args = {
          user_id: getToken(),
          file_id: index
        };
        this.index = index;
        openFileRecentlyApi(this.$axios, this.EDIT, args);
      },
      getData(fileName) {
        console.log("80", fileName)
        let loadTimer = setTimeout(() => {
          this.loading = true;
        }, 1000);
        getOpenFileRecentlyApi(this.$axios, this.EDIT, {user_id: getToken(), file_name: fileName}).then(res => {
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

    white-space: pre !important;
  }

  .hover-tip:hover:after {
    content: ''

  }
</style>
