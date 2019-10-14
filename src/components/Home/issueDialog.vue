<template>
  <div>
    <el-dialog width="30%" title="发布" center :visible.sync="copyDialogFormVisible">
      <span>发布之后，您可以给更多的人带来帮助</span>
      <el-dialog
        center
        title="发布成功"
        :visible.sync="innerVisible"
        append-to-body>
        <a style="color: #0EAA10" :href="address" target="_blank">{{address}}</a>
      </el-dialog>
      <div slot="footer" class="dialog-footer">
        <div slot="footer" class="dialog-footer">
          <el-button @click="talkParent">取 消</el-button>
          <el-button type="primary " @click="issue" :loading="loading">确 定</el-button>
        </div>
      </div>
      <!--      <div>-->
      <!--        {{address}}-->
      <!--      </div>-->
    </el-dialog>
  </div>
</template>

<script>
  import {issueApi} from "../api/folder";
  import {getToken2} from "../../utils/auth";
  import {issueUrl} from "../config";

  export default {
    props: ["dialogFormVisible", "entity", "navMenus"],
    watch: {
      dialogFormVisible(o_v, n_v) {
        this.copyDialogFormVisible = this.dialogFormVisible;
      },
      copyDialogFormVisible(o_v, n_v) {
        if (n_v == true) {
          this.$emit('receive', false)
        }
      },
    },
    data() {
      return {
        copyDialogFormVisible: this.dialogFormVisible,
        loading: false,
        searchEntity: "",
        address: "",
        innerVisible: false
      }
    },
    methods: {
      talkParent() {
        this.$emit('receive', false)
      },
      filterNavMenus(dir) {
        dir.forEach((a_dir) => {
          if (a_dir.childs) {
            this.folder.push(a_dir.entity)
            this.filterNavMenus(a_dir.childs)
          }
        })
      },
      findJieShao(dir, parent, name) {
        dir.forEach((a_dir) => {
          if (a_dir.childs) {
            this.findJieShao(a_dir.childs, parent, name)
          } else {
            if (a_dir.entity.parent === parent && a_dir.entity.alias === name) {
              this.searchEntity = a_dir.entity
            }
          }
        })
      },
      issue() {
        let {id} = this.entity;
        this.findJieShao(this.navMenus, this.entity.path, '介绍');
        let {sheet_id} = this.searchEntity;
        issueApi(this.$axios, this.EDIT, {
          user_id: getToken2('user').id,
          sheet_id: sheet_id,
          catalogue_id: id
        }).then(res => {
          console.log(res);
          let {state, message} = res.data;
          if (!state) {
            this.$message({
              message: message,
              type: 'error'
            });
          } else {
            this.innerVisible = true;
            let {url} = res.data;
            this.address = `${issueUrl}${url}`;
            this.$emit("loadCatalogueData");
            // this.$message({
            //   message: message + ", 已为您粘贴至剪贴板，快去分享吧",
            //   type: 'success'
            // });

            // let copyDom = document.createElement('input');
            // document.body.appendChild(copyDom);
            // copyDom.style['left'] = "-1000px";
            // copyDom.style['position'] = "fixed";
            // copyDom.value = `http://180.169.75.199:5004/sheetapp/share/${url}`;
            // copyDom.select();
            // document.execCommand("Copy");
            // copyDom.parentNode.removeChild(copyDom);
            // this.talkParent();
          }
        });
      },
    }
  }
</script>

<style scoped>
  a:hover {
    background: white;
  }
</style>
