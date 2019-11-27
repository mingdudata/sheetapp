<template>
  <div>
    <el-dialog width="50%" title="新建" center :visible.sync="copyDialogFormVisible">
      <el-form :model="form">
        <el-form-item label="qtxt名称" :label-width="formLabelWidth">
          <el-input v-model="form.name" style="width: 80%"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="talkParent">取 消</el-button>
        <el-button type="primary" @click="addAFile" :loading="loading">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
  import {getToken2} from "../../utils/auth";
  import {dirBuilder} from "../core/builder";
  import {constantRouterMap} from "../../router";
  import {qtxt, p} from "../component/edit/edit_component";
  import {addQTxtApi} from "../api/qtxt";

  export default {
    props: ["dialogFormVisible", 'navMenus', "self", "parent"],
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
      addAFile() {
        if (this.form.name == '') {
          this.$message({
            message: 'qtxt名称不能为空',
            type: 'warning'
          });
          return;
        }
        let user = getToken2('user');
        if (!user) {
          this.$message({
            message: '您还没有登录哦~',
            type: 'error'
          });
          // this.removeToken2('user');
          this.$router.push({path: '/'});
          return;
        }
        this.loading = true;

        addQTxtApi(this.$axios, this.EDIT, {
          alias: this.form.name,
          folder_type: 'qtxt',
          user_id: user.id,
          path: this.parent,
        }).then(res => {
          if (res.data.status == '500') {
            this.$message({
              message: res.data.data,
              type: 'warning'
            });
          } else {
            this.$emit('create', res.data.data);
            this.$message({
              message: '创建成功',
              type: 'success'
            });

            if (res.data.sheet) {
              let entity = dirBuilder(res.data.sheet);
              let routerMap = [];
              constantRouterMap[1].children.push(qtxt(this.self, {
                path: p + entity.path + "",
                id: entity.sheet_id,
                id2: entity.sheet_id2
              }));
              routerMap.push(constantRouterMap[1])
              this.$router.addRoutes(routerMap);
              this.$router.push({path: p + entity.path + ""})
            }

            this.operate(res.data.data);
          }
          this.loading = false;
        }).catch(error => {
          this.loading = false;
        })
      },
      operate(data) {
        this.addRootDirectory();
        this.filterNavMenus(data);
        this.talkParent();
      },
      addRootDirectory() {
        this.folder = []
        this.folder.push({
          alias: "/",
          path: "/"
        });
      }
    },
    created() {
      this.addRootDirectory();
      this.filterNavMenus(this.navMenus)
    },
    watch: {
      dialogFormVisible(o_v, n_v) {
        this.copyDialogFormVisible = this.dialogFormVisible;
        this.addRootDirectory();
        this.filterNavMenus(this.navMenus);
        this.form.folder = "";
      },
      copyDialogFormVisible(o_v, n_v) {
        if (n_v == true) {
          this.$emit('receive', false)
        }
      },
    },
    data() {
      return {
        folder: [],
        folderType: [
          {
            label: "文件",
            id: "file"
          },
          {
            label: "文件夹",
            id: "folder"
          },
        ],
        loading: false,
        copyDialogFormVisible: this.dialogFormVisible,
        form: {
          name: '',
        },
        plan: {},
        formLabelWidth: '120px'
      };
    }
  };
</script>

<style>


</style>
