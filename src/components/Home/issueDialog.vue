<template>
  <div>
    <el-dialog width="30%" title="新建" center :visible.sync="copyDialogFormVisible">
      <span>发布之后，您可以给更多的人带来帮助</span>
      <div slot="footer" class="dialog-footer">
        <el-button @click="talkParent">取 消</el-button>
        <el-button type="primary" @click="issue" :loading="loading">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
  import {issueApi} from "../api/folder";
  import {getToken2} from "../../utils/auth";

  export default {
    props: ["dialogFormVisible", "entity"],
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
      }
    },
    methods: {
      talkParent() {
        this.$emit('receive', false)
      },
      issue() {
        let {id, sheet_id} = this.entity;
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
            let {url} = res.data;
            this.$message({
              message: message + ", 已为您粘贴至剪贴板，快去分享吧",
              type: 'success'
            });
            let copyDom = document.createElement('input');
            document.body.appendChild(copyDom);
            copyDom.style['left'] = "-1000px";
            copyDom.style['position'] = "fixed";
            copyDom.value = `http://180.169.75.199:5004/sheetapp/share/${url}`;
            copyDom.select();
            document.execCommand("Copy");
            copyDom.parentNode.removeChild(copyDom);
            this.talkParent();
          }
        });
      },
    }
  }
</script>

<style scoped>

</style>
