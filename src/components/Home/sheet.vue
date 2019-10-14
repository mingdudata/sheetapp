<template>
  <div style="height: 100%">
    <el-tabs class="marinner" @tab-click="tabClick" @dblclick.native="changeTabName" v-model="editableTabsValue"
             type="card" closable
             @edit="handleTabsEdit">
       <el-tab-pane v-for="(item, index) in editableTabs" :key="item.name" :label="item.title"
                   :name="item.name">
      </el-tab-pane>
    </el-tabs>
     <router-view/>
  </div>
</template>

<script>
  import ElTree from './ElTree'
  import NavMenu from "./NavMenu.vue";
  import Create from './create'

  export default {
    components: {
      NavMenu: NavMenu,
      Create,
      ElTree
    },
    data() {
      return {
        editableTabsValue: false,
        editableTabs: [],
      }
    },
    mounted() {
    },
    methods: {
      handleTabsEdit(targetName, action) {
        if (action === 'add') {
          let newTabName = ++this.tabIndex + '';
          this.editableTabs.push({
            title: 'New Tab',
            name: newTabName,
            content: 'New Tab content',
          });
          this.editableTabsValue = newTabName;
        }
        if (action === 'remove' && event.keyCode != 8) {
          this.editableTabs = this.editableTabs.filter(f => f.id != this.editableTabsValue)
          if (this.editableTabs.length > 0) {
            this.editableTabsValue = this.editableTabs[this.editableTabs.length - 1].name
            this.$router.push({path: "/home" + this.editableTabs[this.editableTabs.length - 1].path})
            this.activeIndex = "/home" + this.editableTabs[this.editableTabs.length - 1].path
          }
          console.log(this.editableTabs, this.editableTabsValue, "458")
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
      tabClick() {
        if (this.isEdit == 3 && this.editableTabsValue == this.editTabsValue) {
          this.isEdit = 2;
          console.log("103, 103")
        } else if (this.isEdit == 3 && this.editableTabsValue != this.editTabsValue) {
          this.isEdit = 4;
        }

        for (let i = 0; i < this.editableTabs.length; i++) {
          console.log("277: ", this.editableTabs[i].name, this.editableTabsValue)
          if (this.editableTabs[i].name == this.editableTabsValue) {
            this.activeIndex = "/home" + this.editableTabs[i].path
            this.$router.push({path: "/home" + this.editableTabs[i].path})
          }
        }
      },
    }
  }
</script>

<style>
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

  .el-cala .el-scrollbar__wrap {
    border-right: solid 1px #e6e6e6;
  }


</style>
