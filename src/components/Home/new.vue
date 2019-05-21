<template>
  <div>
    <el-dialog width="50%" title="新建" center :visible.sync="copyDialogFormVisible">
      <el-form :model="form">
        <el-form-item label="文件名称" :label-width="formLabelWidth">
          <el-input v-model="form.name" style="width: 80%"></el-input>
        </el-form-item>
        <el-form-item label="文件目录" :label-width="formLabelWidth">
          <el-select style="width: 80%" v-model="form.folder" placeholder="请选择文件目录">
            <div v-for="f in folder">
              <el-option :label="f.alias" :value="f.path"></el-option>
            </div>
          </el-select>
        </el-form-item>
        <el-form-item label="文件类型" :label-width="formLabelWidth">
          <el-select style="width: 80%" v-model="form.folderType" placeholder="请选择文件类型">
            <div v-for="f in folderType">
              <el-option :label="f.label" :value="f.id"></el-option>
            </div>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="talkParent">取 消</el-button>
        <el-button type="primary" @click="addAFile">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
  import {defaultOptions} from "../styles";

  export default {
    props: ["dialogFormVisible", 'navMenus'],
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
            message: '文件名不能为空',
            type: 'warning'
          });
          return;
        }

        this.$axios.post(this.EDIT + "/edit_catalogue/add", {
          alias: this.form.name,
          folder_type: this.form.folderType,
          user_id: 1,
          path: this.form.folder,
          options: JSON.stringify(defaultOptions),
          styles: JSON.stringify(defaultOptions.style)
        }).then(res => {
          console.log("65", res)
          if (res.data.status == '500') {
            this.$message({
              message: res.data.data,
              type: 'warning'
            });
          } else {
            this.$emit('create', res.data.data)
            this.$message({
              message: '创建成功',
              type: 'success'
            });
            this.folder = []
            this.filterNavMenus(res.data.data);
            this.talkParent()
          }
        })
      },
    },
    created() {
      this.filterNavMenus(this.navMenus)
      console.log(this.folder)
    },
    watch: {
      dialogFormVisible(o_v, n_v) {
        this.copyDialogFormVisible = this.dialogFormVisible
        console.log(41, this.folder)
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
        copyDialogFormVisible: this.dialogFormVisible,
        gridData: [{
          date: '2016-05-02',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1518 弄'
        }, {
          date: '2016-05-04',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1518 弄'
        }, {
          date: '2016-05-01',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1518 弄'
        }, {
          date: '2016-05-03',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1518 弄'
        }],
        form: {
          name: '',
          folder: '',
          folderType: '',
          date1: '',
          date2: '',
          delivery: false,
          type: [],
          resource: '',
          desc: ''
        },
        formLabelWidth: '120px'
      };
    }
  };
</script>

<style scoped>

</style>
