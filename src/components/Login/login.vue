<template>
  <div style="height: 100%; width: 100%;" class="login-container">
    <div style="width: 400px; height: 400px;margin-top: 100px;  margin: 0px auto; padding-top: 70px;  ">
      <div class="title-container">
        <h3 class="title">
          系统登录
        </h3>
      </div>
      <el-form ref="ruleForm" :model="ruleForm" :rules="rules" class="login-form"
               auto-complete="on" label-position="left">
        <el-form-item prop="username">
                    <span class="svg-container">
                        <img src="/static/Images/yonghu-2.png"
                             style="height: 20px; width: 20px; position: absolute; top: 12px;"/>
                    </span>
          <el-input v-model="ruleForm.username" placeholder="账号"
                    name="username" type="text" auto-complete="on"/>
        </el-form-item>
        <el-form-item prop="password">
                    <span class="svg-container">
                        <img src="/static/Images/mima-2.png"
                             style="height: 20px; width: 18px; position: absolute; top: 12px;"/>
                    </span>
          <el-input :type="passwordType" v-model="ruleForm.password" placeholder="密码"
                    name="password" auto-complete="on" @keyup.enter.native="handleLogin"/>
          <span class="show-pwd" @click="showPwd">
                        <div v-if="eye">
                            <img src="/static/Images/eye-close.png"
                                 style="height: 20px; width: 20px; position: absolute; top: 8px; left: -30px"/>
                        </div>
                        <div v-else>
                            <img src="/static/Images/eye-open.png"
                                 style="height: 20px; width: 20px; position: absolute; top: 8px; left: -30px"/>
                        </div>
                    </span>
        </el-form-item>

        <el-button :loading="loading" type="primary" style="width:100%;margin-bottom:30px;" @click="submitForm">
          登录
        </el-button>


        <div style="position:relative; top: 10px;">
          <div class="tips">
            <span>账号 : 123456</span>
            <span>密码 : 123456</span>
          </div>
          <el-button class="thirdparty-button" type="primary" @click="weixinLogin">
            微信登录
          </el-button>
        </div>
      </el-form>
    </div>
  </div>
</template>


<script>
  import {getToken, setToken, setToken2, weixin_url} from "../../utils/auth";
  import {mapGetters, mapMutations} from 'vuex'

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
        eye: false,
        weixinlogin: "",
        loading: false,
        myWindow: null,
        passwordType: 'password',
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
    computed: {
      ...mapGetters([
        'wxwindow',
      ])
    },
    methods: {
      ...mapMutations({
        setWxWindow: "SET_WX_WINDOW",
      }),
      weixinLogin() {
        if (this.wxwindow) {
          this.wxwindow.focus()
          return;
        }
        let self = this;
        let myWindow = window.open(weixin_url, "", "width=500,height=500");
        this.setWxWindow(myWindow);
        var loop = setInterval(function () {
          if (myWindow.closed) {
            if (getToken() && self.$route.path == '/login') {
              self.$router.push({path: '/home'})
            }
            self.setWxWindow(null);
            clearInterval(loop);
          }
        }, 1000);
      },
      LoginByUsername() {
        let res = this.$axios.post(this.EDIT + "/edit_login", {
          username: this.ruleForm.username + "",
          password: this.ruleForm.password + ""
        });
        console.log("146", res);
        return res;
      },
      showPwd() {
        if (this.passwordType === 'password') {
          this.passwordType = ''
          this.eye = true
        } else {
          this.passwordType = 'password'
          this.eye = false
        }
      },
      submitForm() {
        this.loading = true;
        let res = this.$axios.post(this.EDIT + "/edit_login", {
          username: this.ruleForm.username + "",
          password: this.ruleForm.password + ""
        });
        res.then(res => {
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
            setToken(this.ruleForm.username);

              setToken2("user", res.data.data);

            this.$router.push({path: '/home'})
          }
          this.loading = false;
        }).catch(err => {
          this.loading = false;
        })
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
    width: 470px;
  }
</style>


<style>
  .login-container .el-input input {
    color: #fff;
  }

  .tips {
    font-size: 14px;
    color: #fff;
    margin-bottom: 10px;
  }

  span .first-of-type {
    margin-right: 16px;
  }

  .login-container .el-input {
    display: inline-block;
    height: 47px;
    width: 85%;
  }

  .login-container .el-input input {
    background: transparent;
    border: 0px;
    -webkit-appearance: none;
    border-radius: 0px;
    padding: 12px 5px 12px 15px;
    color: #eee;
    height: 47px;
    caret-color: #fff;
  }

  .el-input input:-webkit-autofill {
    -webkit-box-shadow: 0 0 0px 1000px #283443 inset !important;
    -webkit-text-fill-color: #fff !important;
  }

  .el-form-item {
    border: 1px solid rgba(255, 255, 255, 0.1);
    /*background: rgba(0, 0, 0, 0.1);*/
    border-radius: 5px;
    color: #454545;
  }
</style>


<style>
  .login-container {
    position: fixed;
    height: 100%;
    width: 100%;
    background-color: #2d3a4b;
  }

  .login-container .login-form {
    position: absolute;
    left: 0;
    right: 0;
    width: 520px;
    max-width: 100%;
    padding: 35px 35px 15px 35px;
    margin: 10px auto;
  }

  .login-container .tips {
    font-size: 14px;
    color: #fff;
    margin-bottom: 10px;
  }

  .login-container .tips span:first-of-type {
    margin-right: 16px;
  }

  .login-container .svg-container {
    padding: 6px 5px 6px 15px;
    color: #889aa4;
    vertical-align: middle;
    width: 30px;
    display: inline-block;
  }

  .login-container .title-container {
    position: relative;
  }

  .login-container .title-container .title {
    font-size: 26px;
    color: #eee;
    margin: 0px auto 10px auto;
    text-align: center;
    font-weight: bold;
  }

  .login-container .title-container .set-language {
    color: #fff;
    position: absolute;
    top: 5px;
    right: 0px;
  }

  .login-container .show-pwd {
    position: absolute;
    right: 10px;
    top: 7px;
    font-size: 16px;
    color: #889aa4;
    cursor: pointer;
    user-select: none;
  }

  .thirdparty-button {
    position: absolute;
    right: 0;
    bottom: -10px;
  }

  el-input::-webkit-input-placeholder {
    　　coloc: #000;
  }
</style>
