<template xmlns:v-contextmenu="http://www.w3.org/1999/xhtml">
  <div class="contain" style="width: 100%; height: 100%; overflow: hidden" @click="hideInput">
    <New :self="this" @create="pushIntoMenuData" v-if="showNewCompent == true" :navMenus="menuData" @receive="receive"
         :dialogFormVisible="dialogFormVisible"/>
    <el-row class="tac" style="height: 100%; width: 100%;">
      <el-col style="height: 100%; width: 280px; background: #FBFBFB" :span="4">
        <el-scrollbar class="el-cala" style="height: 100%;  ">
          <div>
            <views @loadCatalogueData="loadCatalogueData"/>
            <el-button icon="el-icon-plus" @click="openNewButton" round style="margin: 12px">New</el-button>
          </div>
        </el-scrollbar>
      </el-col>
      <el-col style="position: absolute; left: 280px; top: 0px" :span="20">
        <sheet/>
      </el-col>
    </el-row>
  </div>
</template>

<script>
  import ElTree from './ElTree'
  import Views from './views'
  import New from './new'
  import {styles} from "../styles";
  import {constantRouterMap} from "../../router";
  import Sheet from './sheet'
  import {openFileRecentlyApi} from "../api/folder";
  import {getToken, getToken2, removeToken2} from "../../utils/auth";
  import {mapGetters, mapMutations} from 'vuex'
  import {edit, p} from "../component/edit/edit_component";

  export default {
    name: "index",
    components: {
      New,
      ElTree,
      Sheet,
      Views
    },
    computed: {
      ...mapGetters([
        'active_index',
        'menuData'
      ])
    },
    data() {
      return {
        styles: styles,
        query: {
          'trade_code': '600548.SH',
          'table_type': '资产负债表',
          'report_season_list': ['年报', '三季报'],
          'hide_checked': false,
          'sheet_type_list': ['合并报表', '合并报表调整', '母公司报表', '母公司报表调整'],
          'time_range': [2017, 2018],
          'unit': '元',
          'decimal_num': 5,
        },
        openSheet: [],
        isEdit: 1,
        dialogFormVisible: false,
        options: {
          showFreeze: false,  // 网格不显示
          showEditor: true,  // 不可编辑状态
          autoLoad: true,    // up or down 不加载
          rowWidth: {         // 第一列的width为180
            state: true,
            width: 240
          },
          view: {
            width: () => document.getElementsByClassName(('el-col-20'))[0].clientWidth,
          },
          row: {
            len: 10,
            height: 25,
          },
          col: {
            len: 3,
            width: 140,
            indexWidth: 60,
            minWidth: 60,
          },
          showGrid: true,
          showToolbar: true,
        },   // 10 and 20
        searchValue: {},
        len: 0,
        contextC: null,
        editTabsValue: '-1',
        router_b: [],
        editableTabsValue: '1',
        editableTabs: [],
        showNewCompent: false,
        searchIndex: []
      }
    },
    mounted() {

      this.loadCataloguePromise().then(res => {
        this.setMenuData(res.data);
        this.showNewCompent = true

        let routerMap = [];
        let pm = [];
        routerMap.push(constantRouterMap[1])
        this.create_route_b(this.menuData, pm, p)
        routerMap[0].children = pm;
        this.$router.addRoutes(routerMap);

        let redirect = this.$route.query.redirect;
        if (redirect) {
          let exist = false
          Object.keys(pm).forEach(e => {
            if (pm[e].path == redirect)
              exist = true;
          });
          if (exist == false) {
            redirect = "/home"
          }
          redirect = decodeURIComponent(redirect || '/');
          this.$router.push({path: redirect})
        }
      });
    },
    methods: {
      ...mapMutations({
        setActiveIndex: "SET_ACTIVE_INDEX",
        setMenuData: "SET_MENU_DATA"
      }),
      loadCatalogueData() {
        this.loadCataloguePromise().then(res => {
          this.setMenuData(res.data);
        })
      },
      redirect(pm, redirect_str) {
        let exist = false
        Object.keys(pm).forEach(e => {
          if (pm[e].path == redirect_str)
            exist = true;
        });
        if (exist == false) {
          redirect_str = "/home"
        }
        redirect_str = decodeURIComponent(redirect_str || '/');
        this.$router.push({path: redirect_str})
      },
      menuhover(pm) {
        this.contextC = pm.target;
      },
      redirect(redirect_str) {
        this.$router.push({path: redirect_str})
      },
      renameFile(vm, event) {
        console.log(vm, event)
        let e = event;
        var x = e.pageX
        var y = e.pageY
        var ele = document.elementFromPoint(x - 50, y - 20);
        console.log(ele)
      },
      removeFile(vm, event) {
        let e = event;
        var x = e.pageX
        var y = e.pageY
        var ele = document.elementFromPoint(x - 20, y - 20);
      },
      pushToTab(index) {
        this.getmenuData(this.menuData, index)
        this.editableTabs.push({
          title: this.searchValue.alias,
          name: index,
          id: index,
        })
        this.editableTabsValue = index + ""
      },
      hideInput() {
        if (document.getElementById("temp_input") == null) {
          this.isEdit = 1
          return;
        }
        if (this.isEdit == 3) {
          if (document.getElementById("temp_input").value == '') {
            this.$message({
              message: '文件名不能为空',
              type: 'warning'
            });
            return;
          }
          let pn = document.getElementById("temp_input").parentNode;
          let ti = document.getElementById("temp_input").value;
          for (let i = 0; i < this.editableTabs.length; i++) {
            console.log(this.editableTabsValue, this.editableTabs[i], "117")
            if (this.editableTabs[i].name == this.editableTabsValue) {
              this.editableTabs[i].title = ti;
              this.$axios.post(this.EDIT + "/edit_catalogue/rename", {
                id: this.editableTabs[i].id,
                name: ti
              }).then(res => {
                this.loadCatalogue();
              })
            }
          }
          pn.removeChild(document.getElementById("temp_input"))
          this.isEdit = 1
        } else if (this.isEdit == 4) {
          if (document.getElementById("temp_input") == null) {
            this.isEdit = 1
            return;
          }
          if (document.getElementById("temp_input").value == '') {
            this.$message({
              message: '文件名不能为空',
              type: 'warning'
            });
            this.editableTabsValue = this.editTabsValue
            return;
          }

          let ti = document.getElementById("temp_input").value;
          for (let i = 0; i < this.editableTabs.length; i++) {
            if (this.editableTabs[i].name == this.editTabsValue) {
              this.editableTabs[i].title = ti;
              this.$axios.post(this.EDIT + "/edit_catalogue/rename", {
                id: this.editableTabs[i].id,
                name: ti
              }).then(res => {
                this.loadCatalogue();
              })
            }
          }
          this.isEdit = 1
          document.getElementById("temp_input").parentNode.removeChild(document.getElementById("temp_input"))
        }

        if (this.isEdit == 2) {
          this.isEdit = 3
        }
      },
      changeTabName(event) {
        console.log("186")
        for (let i = 0; i < this.editableTabs.length; i++) {
          if (this.editableTabs[i].name == this.editableTabsValue && this.isEdit == 1) {
            this.editTabsValue = this.editableTabsValue
            let this_dom = event.srcElement
            console.log("196： ", this_dom.getAttribute("class"))
            if ('el-tabs__nav-scroll' == this_dom.getAttribute("class")) {
              return;
            }
            this.isEdit = 3
            // debugger
            let new_span = document.createElement("input");
            let v = this_dom.innerHTML;
            new_span.setAttribute("id", "temp_input")
            this_dom.appendChild(new_span);
            new_span.setAttribute("style", "position: relative; left: -10px;")
            new_span.autofocus = true
            document.getElementById("temp_input").value = this.editableTabs[i].title
            this.editableTabs[i].title = ""

            let self = this
            new_span.onkeypress = function (e) {
              if (e.keyCode == 13) {
                if (document.getElementById("temp_input").value == '') {
                  self.$message({
                    message: '文件名不能为空',
                    type: 'warning'
                  });
                  return;
                }

                self.$axios.post(self.EDIT + "/edit_catalogue/rename", {
                  id: self.editableTabs[i].id,
                  name: document.getElementById("temp_input").value
                }).then(res => {
                  self.loadCatalogue();
                  self.editableTabs[i].title = document.getElementById("temp_input").value
                  this_dom.removeChild(this_dom.getElementsByTagName("input")[0])
                  this.isEdit = 1;
                  return;
                })
              }
            }
          }
        }
      },
      pushIntoMenuData(value) {
        console.log(value, "./...294")
        this.setMenuData(value);
      },
      receive(value) {
        console.log("90...", value)
        this.dialogFormVisible = value;
      },
      openNewButton() {
        this.dialogFormVisible = true;
      },
      addUrlRelPath(query) {
        query.url_rel_path = "/sec_page/600548"
        return query
      },
      loadCatalogue() {
        this.$axios.get(this.EDIT + "/edit_catalogue", {
          params: {
            user_id: getToken2('user').id
          }
        }).then(res => {
          this.setMenuData(res.data);
          this.showNewCompent = true
        })
      },
      loadCataloguePromise() {
        let user = getToken2('user');
        if (!user) {
          this.$message({
            message: '您还没有登录哦~',
            type: 'error'
          });
          removeToken2('user');
          this.$router.push({path: '/login'})
          return;
        }

        return new Promise((resolve, reject) => {
          resolve(this.$axios.get(this.EDIT + "/edit_catalogue", {
            params: {
              user_id: user.id
            }
          }))
        })
      },
      loadSheetData(item) {
        return new Promise((resolve, reject) => {
          console.log("item", item.sheet)
          this.$axios.get(this.EDIT + "/edit_find", {
            params: {
              id: item.sheet.id,
            }
          }).then(response => {
            item.sheet.data = JSON.parse(response.data.sheet_details)
            this.options = JSON.parse(response.data.sheet_options)
            item.sheet.styles = JSON.parse(response.data.sheet_styles)
            var d1 = document.getElementById(('x-spreadsheet-demo'));
            var d2 = document.getElementsByClassName('x-spreadsheet')[0];
            if (d1 !== undefined && d2 !== undefined) {
              d1.removeChild(d2);
            }

            resolve(item)
          })
        })
      },
      tabClick() {
        if (this.isEdit == 3 && this.editableTabsValue == this.editTabsValue) {
          this.isEdit = 2;
        } else if (this.isEdit == 3 && this.editableTabsValue != this.editTabsValue) {
          this.isEdit = 4;
        }

        for (let i = 0; i < this.editableTabs.length; i++) {
          if (this.editableTabs[i].name == this.editableTabsValue) {
            this.setActiveIndex("/home" + this.editableTabs[i].path);
            this.$router.push({path: "/home" + this.editableTabs[i].path})
          }
        }
      },
      getmenuData(dir, index) {
        dir.forEach((a_dir) => {
          if (a_dir.childs) {
            this.getmenuData(a_dir.childs, index)
          } else {
            if (a_dir.entity.id == index) {
              this.searchValue = a_dir.entity
            }
          }
        })
      },
      getmenuDataIndex(dir, index) {
        dir.forEach((a_dir) => {
          if (a_dir.childs) {
            this.getmenuDataIndex(a_dir.childs, index)
          } else {
            if ("/home" + a_dir.entity.path == index) {
              this.searchIndex = a_dir.entity
            }
          }
        })
      },
      create_route_b(dir, arr, p) {
        dir.forEach((a_dir) => {
          if (a_dir.childs) {
            this.create_route_b(a_dir.childs, arr, p)
          } else {
            let args = edit(this, {path: p + a_dir.entity.path + "", id: a_dir.entity.sheet_id, id2: a_dir.entity.id, name: a_dir.entity.alias });
            arr.push(args);
          }
        })
      },
      findIndex() {

      },
      rightShow(index, indexPath) {
      },
      saveRecentlyFile(index) {
        // 最近一次点击 插入数据库
        let args = {
          user_id: getToken2('user').id,
          file_id: index
        };
        openFileRecentlyApi(this.$axios, this.EDIT, args);
      },
      open(index, indexPath) {
        this.getmenuDataIndex(this.menuData, index)
        index = this.searchIndex.id + ""
        this.getmenuData(this.menuData, index)
        let item = this.searchValue

        let have = this.isHavaShowTab(index);
        this.saveRecentlyFile(index);
        if (have == -1) {
          let index_tab = this.openSheet.length + 1;
          this.len = this.len + 1;
          this.editableTabs.push({
            title: item.alias,
            name: index,
            id: index,
            path: item.path
          });
          this.editableTabsValue = this.isHavaShowTab(index) + "";
          this.closeOpenSheetShow()
        } else {
          this.closeOpenSheetShow();
          this.editableTabsValue = have + "";
          this.openSheetShow(item.name)
        }
      },
      openSheetShow(name) {
        for (let i = 0; i < this.openSheet.length; i++) {
          if (this.openSheet[i].name == name) {
            this.openSheet[i].sheet.show = true
          }
        }
      },
      openSheetShowId(name) {
        for (let i = 0; i < this.openSheet.length; i++) {
          if (this.openSheet[i].id == name) {
            this.openSheet[i].sheet.show = true
          }
        }
      },
      closeOpenSheetShow() {
        for (let i = 0; i < this.openSheet.length; i++) {
          this.openSheet[i].sheet.show = false
        }
      },
      getTabIndex(name) {
        console.log("437", name, this.editableTabs)
        for (let i = 0; i < this.editableTabs.length; i++) {
          if (this.editableTabs[i].id === name) {
            return i
          }
        }

        return -1
      },
      isHavaShowTab(name) {
        console.log("372: ", name)
        for (let i = 0; i < this.editableTabs.length; i++) {
          if (this.editableTabs[i].id === name) {
            return this.editableTabs[i].name
          }
        }

        return -1
      },
      handleOpen(key, keyPath) {
        console.log(key, keyPath);
      },
      handleClose(key, keyPath) {
        console.log(key, keyPath);
      }
    }
  }
</script>

<style>
  .right-menu {
    border: 1px solid #eee;
    box-shadow: 0 0.5em 1em 0 rgba(0, 0, 0, .1);
    border-radius: 1px;
    display: block;
    font-family: Microsoft Yahei, Avenir, Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: #2c3e50;
    position: fixed;
    background: #fff;
    border: 1px solid rgba(0, 0, 0, .2);
    border-radius: 3px;
    z-index: 999;
    display: none;
  }

  a:-webkit-any-link {
    color: -webkit-link;
    cursor: pointer;
    text-decoration: underline;
  }

  a:hover {
    background: #42b983;
    color: #fff;
  }

  a {
    padding: 2px 15px;
    height: 28px;
    line-height: 28px;
    text-align: center;
    display: block;
    color: #1a1a1a;

  }

  .el-menu {
    height: 100%;
  }

  .contain {
    user-seletct: none;
    -webkit-user-seletct: none;
    -moz-user-seletct: none;
    -ms-user-seletct: none;
  }

  .el-scrollbar {
    height: 100%;
  }

  .el-cala .el-scrollbar__wrap {
    border-right: solid 1px #e6e6e6;
  }

  .el-scrollbar__wrap {
    overflow: scroll;
    /*width: 110%;*/
    /*height: 120%;*/
  }

  .el-scrollbar__view {
    height: 100%;
  }

  .el-menu {
    border-right: none;
  }

  .el-tabs__header {
    margin: 0px;
    color: red;
  }
</style>
