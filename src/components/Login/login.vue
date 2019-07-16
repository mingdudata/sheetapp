<template>
  <div class="contain">
    <div style="width: 400px; height: 400px;margin-top: 100px;  margin: 0px auto; padding-top: 100px;  ">
      <div class="title-container">
        <h3 class="title">系统登录</h3>
      </div>
      <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
        <el-form-item class="redItem" label="账号" prop="username">
          <el-input v-model.number="ruleForm.username"></el-input>
        </el-form-item>
        <el-form-item class="redItem" label="密码" prop="password">
          <el-input type="password" v-model="ruleForm.password" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item class="redItem2">
          <el-button type="primary" @click="submitForm('ruleForm')">提交</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
  import {mapActions} from 'vuex'
  import {setToken} from "../../utils/auth";

  export default {
    data() {
      var validatePass = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入密码'));
        } else {
          callback();
        }
      };
      var validateUser = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入用户名'));
        } else {
          callback();
        }
      };
      return {
        ruleForm: {
          username: '',
          password: ''
        },
        rules: {
          password: [
            {validator: validatePass, trigger: 'blur'}
          ],
          username: [
            {validator: validateUser, trigger: 'blur'}
          ]
        }
      };
    },
    methods: {
      ...mapActions([
        'LoginByUsername', // 将 `this.add()` 映射为 `this.$store.dispatch('increment')`
      ]),
      LoginByUsername() {
        return this.$axios.post(this.EDIT + "/edit_login", {
          username: this.ruleForm.username + "",
          password: this.ruleForm.password + ""
        })
      },
      submitForm(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            this.LoginByUsername().then(res => {
              console.log(res, "76")
              if (res.data.status == false) {
                this.$message({
                  message: res.data.message,
                  type: 'error'
                });
              } else {
                this.$message({
                  message: '登录成功',
                  type: 'success'
                });
                setToken(this.ruleForm.username)
                this.$router.push({path: '/home'})
              }
            })
          } else {
            console.log('error submit!!');
            return false;
          }
        });
      },
      resetForm(formName) {
        this.$refs[formName].resetFields();
      }
    }
  }
</script>

<style scoped>
  .contain {
    width: 100%;
    height: 100%;
    background-color: #2d3a4b;
  }

  .title {
    font-size: 26px;
    color: #eeeeee;
    margin: 0px auto 40px auto;
    text-align: center;
    font-weight: bold;
  }
</style>


<style>
  .redItem .el-form-item__label {
    color: #eee;
  }

  .redItem2 .el-form-item__label {
    width: 400px;
  }
</style>
