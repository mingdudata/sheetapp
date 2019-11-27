<template xmlns:v-contextmenu="http://www.w3.org/1999/xhtml">
  <div>
    <div>
      <div style="margin-left: 20px; margin-top: 10px; display: inline-block; letter-spacing: 5px">
      <span @click="handler(1)">
        <span v-if="viewId == 1" style="font-size: 26px; color: #0EAA10"><i class="el-icon-tickets"></i></span>
        <span class="hover-tip" data-tooltip="打开最近" v-else style="font-size: 26px;  ">
          <i class="el-icon-document"></i></span>
      </span>
        <span @click="handler(2)">
        <span v-if="viewId == 2" style="font-size: 26px; color: #0EAA10">
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
          <v-contextmenu ref="contextmenu" @contextmenu="folderOrFile">
            <context-menu :disableFile="disableFile" :disableFolder="disableFolder"
                          @issue="issue" @createMD="createMD" @revisions="revisions" @renameFile="renameFile"
                          :disableDelete="disableDelete" :disableRemove="disableRemove" :isIssue="isIssue"
                          @removeFile="removeFile"/>
          </v-contextmenu>
        </div>
      </div>
      <div v-show="change == 2">
        <div class="folder_menu" v-contextmenu:contextmenu>
          <el-menu background-color="#FBFBFB" active-text-color="rgb(14, 170, 16)" router :default-active="index"
                   @select="open">
            <nav-menu :navMenus="menuData"/>
          </el-menu>
          <v-contextmenu ref="contextmenu" @contextmenu="folderOrFile">
            <context-menu :disableFile="disableFile" :disableFolder="disableFolder" :disableIssue="disableIssue"
                          :disableDelete="disableDelete" :disableRemove="disableRemove" :isIssue="isIssue"
                          @issue="issue" @createMD="createMD" @revisions="revisions" @renameFile="renameFile"
                          @removeFile="removeFile"/>
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

    <div>
      <md-dialog :self="this" @create="pushIntoMenuData" :parent="parentMD" :navMenus="menuData" @receive="receive"
                 :dialogFormVisible="dialogFormVisible" ref="md"/>
      <issue-dialog @receive="receive2" :entity="entity" :navMenus="menuData"
                    :dialogFormVisible="issueDialogFormVisible" @loadCatalogueData="loadCatalogueData"/>
    </div>
  </div>
</template>

<script>
  import NavMenu from "./NavMenu.vue";
  import RecentlyOpen from "./RecentlyOpen"
  import Search from './search'
  import MdDialog from './mdDialog'
  import IssueDialog from './issueDialog'
  import ContextMenu from './contextmenu'
  import {
    changeFileNameApi,
    getOpenFileApi,
    getOpenFileRecentlyApi,
    openFileRecentlyApi,
    removeFileApi,
    revisionsApi
  } from "../api/folder";
  import {getToken2} from "../../utils/auth";
  import {mapGetters, mapMutations} from 'vuex';
  import {addQTxtApi} from "../api/qtxt";
  import {dirBuilder} from "../core/builder";
  import {qtxt, p} from "../component/edit/edit_component";
  import {constantRouterMap} from "../../router";
  import {searchName} from "../config";

  export default {
    name: "views",
    components: {
      NavMenu,
      RecentlyOpen,
      Search,
      MdDialog,
      IssueDialog,
      ContextMenu
    },
    data() {
      return {
        change: 1,
        viewId: 1,
        label_change: 1,
        data: [],
        loading: false,
        index: "",
        centerDialogVisible: false,
        input: "",
        disableFolder: false,
        disableFile: false,
        disableIssue: false,
        disableDelete: false,
        dialogFormVisible: false,
        disableRemove: false,
        parentMD: "",
        searchEntity: null,
        issueDialogFormVisible: false,
        rootFolder: null,
        isIssue: false
      }
    },
    watch: {
      $route(to, from) {
        this.setActiveIndex(to.path);
        this.index = to.path;
      },
      menuData() {
        this.getData("");
      },
      change() {
        let {change} = this;
        if (change === 2) {
          setTimeout(() => {
            let dom = document.getElementsByClassName('el-menu-item is-active');
            let dom2 = document.getElementById("quill_id");
            if (dom2) {
              dom2.style['height'] = '0px';
              dom[dom.length - 1].scrollIntoView({behavior: "smooth", block: "center", inline: "nearest"});
              dom2.style['height'] = '100%';
            } else {
              dom[dom.length - 1].scrollIntoView({behavior: "smooth", block: "center", inline: "nearest"});
            }
            // }
          }, 50);
        }
      }
    },
    computed: {
      ...mapGetters([
        'active_index',
        'entity',
        'menuData',
        'xs'
      ])
    },
    mounted() {
      this.index = this.active_index;
      this.getData("");
    },
    methods: {
      ...mapMutations({
        setActiveIndex: "SET_ACTIVE_INDEX",
        setMenuData: "SET_MENU_DATA",
      }),
      receive(value) {
        this.dialogFormVisible = value;
      },
      receive2(value) {
        this.issueDialogFormVisible = value;
      },
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
      pushIntoMenuData(value) {
        this.setMenuData(value);
      },
      folderOrFile(e) {
        console.log(this.entity);
        let {type, parent, alias} = this.entity;
        let {sheet} = this.entity;
        if (sheet) {
          let {editor} = sheet;
          if (!sheet || !editor || editor === 2 || editor === 3) {
            this.disableIssue = true;
            this.disableFolder = true;
            this.disableFile = true;
            this.disableDelete = true;
            return;
          }
        }

        if (type === 2) {
          this.disableFolder = true;
          this.disableFile = false;
          this.disableDelete = false;
          this.disableRemove = false;
          if (parent === '/') {
            this.disableIssue = false;
          } else {
            this.disableIssue = true;
          }
        } else if (type === 1) {
          this.disableFolder = false;
          this.disableDelete = false;
          this.disableRemove = false;
          this.disableFile = true;
          this.disableIssue = true;
        } else {
          this.disableDelete = false;
          this.disableRemove = false;
          this.disableIssue = true;
          this.disableFolder = true;
          this.disableFile = true;
        }

        // 如果右击的是 ‘介绍’，则isIssue = true
        this.isIssue = false;
        if (alias === searchName) {
          this.rootFolder = null;
          this.searchRootFolder(this.menuData, parent, searchName);
          if (this.rootFolder) {
            const {state} = this.rootFolder.sheet;
            if (state) {
              this.isIssue = true;
              this.disableDelete = true;
              this.disableRemove = true;
            }
          }
        }
      },
      revisionOpen() {
        let args = {
          _id: this.entity.id,
        };
        revisionsApi(this.$axios, this.EDIT, args).then(res => {
          if (!res.data.state) {
            this.$message({message: res.data.message, type: 'error', showClose: true});
          } else {

            if (res.data.data === "error") {
              return;
            }
            let data = typeof res.data.data.sheet_details == 'string'
              ? JSON.parse(res.data.data.sheet_details) : res.data.data.sheet_details;
            let styles = "";
            if (typeof res.data.data.sheet_styles === "string" && JSON.parse(res.data.data.sheet_styles)) {
              styles = JSON.parse(res.data.data.sheet_styles);
            } else {
              styles = res.data.data.sheet_styles;
            }
            let options = this.loadRowAndCol({}, res.data.data.neat_flex, res.data.data.sheet_options);
            args = {
              styles: styles,
              rows: data,
              options: options,
              merges: res.data.data.sheet_merges,
              autofilter: res.data.data.sheet_auto_filter,
              pictures: res.data.data.sheet_pictures,
              flex: this.loadNeatFlex(res.data.data.neat_flex),
              cols: (options && options.cols) || {}
            };
            this.xs.plugIn.openFrame(() => {
              return document.body.clientWidth - 280 - 68
            }, res.data.message, args, {
              axios: this.$axios,
              url: this.EDIT + "/edit_versions/find"
            }, this);
          }
        });
      },
      createMD() {
        this.parentMD = this.entity.path;
        this.dialogFormVisible = true;
      },
      revisions() {
        if ("/home" + this.entity.path !== this.$route.path) {
          this.$router.push({
            path: "/home" + this.entity.path, query: {
              _id: this.entity.id,
              revision: true
            }
          });
        } else {
          this.revisionOpen();
        }
      },
      searchMenuDataIndex(dir, parent, name) {
        dir.forEach((a_dir) => {
          if (a_dir.childs) {
            this.searchMenuDataIndex(a_dir.childs, parent, name)
          } else {
            if (a_dir.entity.parent === parent && a_dir.entity.alias === name) {
              this.searchEntity = a_dir.entity
            }
          }
        })
      },
      searchRootFolder(dir, path, name) {
        dir.forEach((a_dir) => {
          if (a_dir.entity.path === path && a_dir.entity.parent === "/") {
            this.rootFolder = a_dir.entity;
          }

          if (a_dir.childs) {
            this.searchRootFolder(a_dir.childs, path, name)
          }
        })
      },
      issue() {
        let user = getToken2('user');
        if (!user) {
          this.$message({
            message: '您还没有登录哦~',
            type: 'error'
          });
          this.$router.push({path: '/'});
          return;
        }
        this.searchEntity = null;
        this.searchMenuDataIndex(this.menuData, this.entity.path, searchName);
        if (this.searchEntity === null) {
          addQTxtApi(this.$axios, this.EDIT, {
            alias: '介绍',
            folder_type: 'qtxt',
            user_id: user.id,
            path: this.entity.path,
          }).then(res => {
            if (res.data.status == '500') {
              this.$message({
                message: res.data.data,
                type: 'warning'
              });
            } else {
              this.pushIntoMenuData(res.data.data);
              this.$message({
                message: '创建成功',
                type: 'success'
              });
              if (res.data.sheet) {
                let entity = dirBuilder(res.data.sheet);
                let routerMap = [];
                constantRouterMap[1].children.push(qtxt(this, {
                  path: p + entity.path + "",
                  id: entity.sheet_id,
                  id2: entity.sheet_id2
                }));
                console.log(constantRouterMap[1]);
                routerMap.push(constantRouterMap[1])
                this.$router.addRoutes(routerMap);
                this.$router.push({path: p + entity.path + ""})
              }
              this.$refs.md.operate(res.data.data);
            }
          })
        } else {
          this.issueDialogFormVisible = true;
        }
      },
      loadRowAndCol(options, neat_flex, op) {
        if (neat_flex) {
          options.row = {
            len: neat_flex["rows"],
          };
          options.rowWidth = {
            state: !0,
            width: 240
          };
          options.view = {
            height: () => 150 * 25,
          };
          options.col = {
            len: neat_flex["col"],
          };

        }
        options.view = {
          width: () => {
            return document.body.clientWidth - 280 - 10 - 68;
          }
        };
        if (typeof op === 'string') {
          op = JSON.parse(op)
        }
        if (op.cols) {
          options.cols = op.cols
        }
        if (op.row) {
          options.row = op.row
        }
        options.showFreeze = true;
        return options;
      },
      loadNeatFlex(neat_flex) {
        if (neat_flex) {
          return neat_flex.neat_flex;
        }
        return {};
      },
      removeFile() {
        let args = {
          user_id: getToken2('user').id,
          file_id: this.entity.file_id || "/home" + this.entity.path,
          _id: this.entity.id,
          type: this.entity.type,
          path: this.entity.parent,
          path2: this.entity.path,
        };
        console.log(this.entity, "92")
        removeFileApi(this.$axios, this.EDIT, args).then(res => {
          this.$message({message: '删除成功', type: 'success', showClose: true});
          this.$emit("loadCatalogueData");
          this.$router.push({path: '/home'})
        });
      },
      renameFile() {
        this.centerDialogVisible = true;
        this.input = this.entity.alias;
        console.log(this.entity, "92")
      },
      loadCatalogueData() {
        this.$emit("loadCatalogueData");
      },
      getEntity(entity) {
        console.log("96", entity)
        this.entity = entity;
      },
      handler(value) {
        if (value == 1) {
          this.getData("")
        }
        this.viewId = value;
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
        console.log("279", index, indexPath)
        let args = {
          user_id: getToken2('user').id,
          file_id: index
        };
        this.index = index;
        openFileRecentlyApi(this.$axios, this.EDIT, args);
      },
      getData(fileName = "") {
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
