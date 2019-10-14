<template>
  <div>
    <div style="max-width: 1012px; margin: 0 auto;">
      <div style="padding-top: 24px; padding-bottom: 24px">
        <div style="position: relative; top: 5px; display: inline-block">
          <i class="el-icon-tickets"/>
          {{user_name}}
          <span style="margin: 0 .25em;">
						/
					</span>
          {{alias}}
        </div>
        <div v-if="load" style="float: right">
          <div style="margin: 0 10px 0 0; display: inline-block">
						<span v-if="!login">
							<span @click="lookEvent" data-tooltip="你必须要登录才能继续" class="btn btn-sm btn-with-count d-hover"
                    style="float: left; background-color: #eff3f6; background-image:linear-gradient(-180deg,#fafbfc,#eff3f6 90%)">
								<svg class="csvg octicon octicon-eye v-align-text-bottom" viewBox="0 0 16 16"
                     version="1.1" width="16" height="16" aria-hidden="true">
									<path fill-rule="evenodd"
                        d="M8.06 2C3 2 0 8 0 8s3 6 8.06 6C13 14 16 8 16 8s-3-6-7.94-6zM8 12c-2.2 0-4-1.78-4-4 0-2.2 1.8-4 4-4 2.22 0 4 1.8 4 4 0 2.22-1.78 4-4 4zm2-4c0 1.11-.89 2-2 2-1.11 0-2-.89-2-2 0-1.11.89-2 2-2 1.11 0 2 .89 2 2z">
									</path>
								</svg>
									{{lookInfo}}
							</span>
						</span>
            <span v-else>
							<span @click="lookEvent" class="btn btn-sm btn-with-count"
                    style="float: left; background-color: #eff3f6; background-image:linear-gradient(-180deg,#fafbfc,#eff3f6 90%)">
								<svg class="csvg octicon octicon-eye v-align-text-bottom" viewBox="0 0 16 16"
                     version="1.1" width="16" height="16" aria-hidden="true">
									<path fill-rule="evenodd"
                        d="M8.06 2C3 2 0 8 0 8s3 6 8.06 6C13 14 16 8 16 8s-3-6-7.94-6zM8 12c-2.2 0-4-1.78-4-4 0-2.2 1.8-4 4-4 2.22 0 4 1.8 4 4 0 2.22-1.78 4-4 4zm2-4c0 1.11-.89 2-2 2-1.11 0-2-.89-2-2 0-1.11.89-2 2-2 1.11 0 2 .89 2 2z">
									</path>
								</svg>
									{{lookInfo}}
							</span>
						</span>
            <span class="social-count">
							{{look}}
						</span>
          </div>
          <div style="margin: 0 10px 0 0; display: inline-block">
						<span v-if="!login">
							<span @click="likeEvent" data-tooltip="你必须要登录才能继续" class="btn btn-sm btn-with-count  d-hover"
                    style="float: left; background-color: #eff3f6; background-image:linear-gradient(-180deg,#fafbfc,#eff3f6 90%)">
								<svg class="csvg octicon octicon-star v-align-text-bottom" viewBox="0 0 14 16"
                     version="1.1" width="14" height="16" aria-hidden="true">
									<path fill-rule="evenodd"
                        d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z">
									</path>
								</svg>
								点赞
							</span>
						</span>
            <span v-else>
              <span v-if="isLike">
                <span @click="likeEvent" class="btn btn-sm btn-with-count"
                      style="float: left; background-color: #eff3f6; background-image:linear-gradient(-180deg,#fafbfc,#eff3f6 90%)">
								<svg class="csvg octicon octicon-star v-align-text-bottom" viewBox="0 0 14 16"
                     version="1.1" width="14" height="16" aria-hidden="true">
									<path fill-rule="evenodd"
                        d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z">
									</path>
								</svg>
								已点赞
							</span>
              </span>
              <span v-else>
                <span @click="likeEvent" class="btn btn-sm btn-with-count"
                      style="float: left; background-color: #eff3f6; background-image:linear-gradient(-180deg,#fafbfc,#eff3f6 90%)">
								<svg class="csvg octicon octicon-star v-align-text-bottom" viewBox="0 0 14 16"
                     version="1.1" width="14" height="16" aria-hidden="true">
									<path fill-rule="evenodd"
                        d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z">
									</path>
								</svg>
								点赞
							</span>
              </span>
						</span>
            <span class="social-count">
							{{like}}
						</span>
          </div>
          <div style="margin: 0 10px 0 0; display: inline-block">
						<span v-if="!login">
							<span @click="saveEvent" data-tooltip="你必须要登录才能继续" class="btn btn-sm btn-with-count d-hover"
                    style="float: left; background-color: #eff3f6; background-image:linear-gradient(-180deg,#fafbfc,#eff3f6 90%)">
								<svg class="csvg octicon octicon-repo-forked v-align-text-bottom" viewBox="0 0 10 16"
                     version="1.1" width="10" height="16" aria-hidden="true">
									<path fill-rule="evenodd"
                        d="M8 1a1.993 1.993 0 0 0-1 3.72V6L5 8 3 6V4.72A1.993 1.993 0 0 0 2 1a1.993 1.993 0 0 0-1 3.72V6.5l3 3v1.78A1.993 1.993 0 0 0 5 15a1.993 1.993 0 0 0 1-3.72V9.5l3-3V4.72A1.993 1.993 0 0 0 8 1zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3 10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3-10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z">
									</path>
								</svg>
								{{saveInfo}}
							</span>
						</span>
            <span v-else>
							<span @click="saveEvent" class="btn btn-sm btn-with-count"
                    style="float: left; background-color: #eff3f6; background-image:linear-gradient(-180deg,#fafbfc,#eff3f6 90%)">
								<svg class="csvg octicon octicon-repo-forked v-align-text-bottom" viewBox="0 0 10 16"
                     version="1.1" width="10" height="16" aria-hidden="true">
									<path fill-rule="evenodd"
                        d="M8 1a1.993 1.993 0 0 0-1 3.72V6L5 8 3 6V4.72A1.993 1.993 0 0 0 2 1a1.993 1.993 0 0 0-1 3.72V6.5l3 3v1.78A1.993 1.993 0 0 0 5 15a1.993 1.993 0 0 0 1-3.72V9.5l3-3V4.72A1.993 1.993 0 0 0 8 1zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3 10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3-10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z">
									</path>
								</svg>
								{{saveInfo}}
							</span>
						</span>
            <span class="social-count">
							{{save}}
						</span>
          </div>
        </div>
      </div>
      <div class="Box" style="margin-top: 20px; margin-bottom: 100px">
        <div class="Box-header">
          <div class="jieshao">
            <svg class="octicon octicon-book" viewBox="0 0 16 16" version="1.1" width="16"
                 height="16" aria-hidden="true">
              <path fill-rule="evenodd"
                    d="M3 5h4v1H3V5zm0 3h4V7H3v1zm0 2h4V9H3v1zm11-5h-4v1h4V5zm0 2h-4v1h4V7zm0 2h-4v1h4V9zm2-6v9c0 .55-.45 1-1 1H9.5l-1 1-1-1H2c-.55 0-1-.45-1-1V3c0-.55.45-1 1-1h5.5l1 1 1-1H15c.55 0 1 .45 1 1zm-8 .5L7.5 3H2v9h6V3.5zm7-.5H9.5l-.5.5V12h6V3z">
              </path>
            </svg>
          </div>
          介绍
        </div>
        <router-view/>
      </div>
    </div>
  </div>
</template>

<script>
  import {qtxt} from "../component/edit/edit_component";
  import {constantRouterMap} from "../../router";
  import {shareApi} from "../api/share";
  import {getToken2} from "../../utils/auth";
  import {likeApi, lookApi, saveApi} from "../api/share";
  import {p} from "../component/edit/edit_component";

  export default {
    mounted() {
      let user = getToken2('user');
      this.login = user ? true : false;
      this.initRequest();
    },
    data() {
      return {
        user_name: '',
        alias: '',
        sheet_id: -1,
        redirect: "",
        like: 0,
        save: 0,
        look: 0,
        login: false,
        id: -1,
        isLike: false,
        isLook: false,
        isSave: false,
        sheet_path: '',
        load: false,
        user_id: -1,
        lookInfo: "查看",
        saveInfo: "复制"
      }
    },
    methods: {
      lookEvent() {
        if (!this.login) {
          this.$router.push({
            path: '/login', query: {
              redirect: this.$route.path
            }
          });
        } else {
          if (this.user_id === getToken2('user').id) {
            console.log("175", this.sheet_path);
            this.$router.push({path: `${p}${this.sheet_path}`});
            return;
          }

          lookApi(this.$axios, this.EDIT, {
            "user_id": getToken2('user').id,
            "_id": this.id,
          }).then(res => {
            let {look, look_url} = res.data;
            this.look = look;
            this.lookInfo = "已查看";
             constantRouterMap[1].children = [];
            this.$router.push({path: p + look_url});
          });
        }
      },
      likeEvent() {
        if (!this.login) {
          this.$router.push({
            path: '/login', query: {
              redirect: this.$route.path
            }
          });
        } else {
          likeApi(this.$axios, this.EDIT, {
            "user_id": getToken2('user').id,
            "_id": this.id,
            cancel: !this.isLike,
          }).then(res => {
            this.isLike = res.data.like;
            this.like = res.data.number;
          });
        }
      },
      saveEvent() {
        if (!this.login) {
          this.$router.push({
            path: '/login', query: {
              redirect: this.$route.path
            }
          });
        } else {
          if (this.user_id === getToken2('user').id) {
            this.$router.push({path: `${p}${this.sheet_path}`});
            return;
          }

          saveApi(this.$axios, this.EDIT, {
            "user_id": getToken2('user').id,
            "_id": this.id,
          }).then(res => {
            let {save, save_url} = res.data;
            this.save = save;
            this.saveInfo = "已复制";
            constantRouterMap[1].children = [];
            this.$router.push({path: p + save_url});
          })
        }
      },
      initRequest() {
        let path = this.$route.query.redirect;
        if (!path) {
          path = this.$route.path;
        }
        // if(!this.login) {
        //    this.redirect = path;
        //   this.initReadMe();
        //   return;
        // }

        shareApi(this.$axios, this.EDIT, {
          url: path.replace("/share/", ""),
          user_id: !this.login ? -1 : getToken2('user').id,
        }).then(res => {
          const {state} = res.data;
          if (!state) {
            let {message} = res.data;
            this.$message({
              message: message,
              type: 'warning'
            });
            this.$router.push({path: "/home"});
          } else {
            let {user_name, alias, sheet_id, like, look, save, id, isLike, isLook, isSave, user_id, sheet_path} = res.data;
            this.user_name = user_name;
            this.alias = alias;
            this.sheet_id = sheet_id;
            this.redirect = path;
            this.like = like;
            this.look = look;
            this.user_id = user_id;
            this.id = id;
            this.save = save;
            this.sheet_path = sheet_path;
            this.isLike = isLike;
            this.isLook = isLook;
            this.isSave = isSave;
            this.load = true;
            this.initReadMe();
            this.saveInfo = this.isSave ? "已复制" : "复制";
            this.lookInfo = this.isLook ? "已查看" : '查看';
          }
        });
      },
      initReadMe() {
        let routerMap = [];
        let pm = [];
        routerMap.push(constantRouterMap[3]);
        let q = qtxt(null, {path: this.redirect, id: this.sheet_id, name: "xxx"}, {
          theme: 'bubble',
          placeholder: '暂无内容',
          readOnly: true,
          modules: {
            toolbar: []
          },
        }, this.user_id);
        pm.push(q);
        routerMap[0].children = pm;
        this.$router.addRoutes(routerMap);
        console.log(constantRouterMap);
        this.$router.push({path: this.redirect});
      }
    }
  }
</script>

<style scoped>
  .btn {
    position: relative;
    display: inline-block;
    padding: 6px 12px;
    font-size: 14px;
    font-weight: 600;
    line-height: 20px;
    white-space: nowrap;
    vertical-align: middle;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-repeat: repeat-x;
    background-position: -1px -1px;
    background-size: 110% 110%;
    border: 1px solid rgba(27, 31, 35, .2);
    border-radius: .25em;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
  }

  .btn-sm {
    padding: 3px 10px;
    font-size: 12px;
    line-height: 20px;
  }

  .btn-with-count {
    float: left;
    border-top-right-radius: 0;
    border-bottom-right-radius: 0;
  }

  .csvg {
    margin-right: 1px;
    top: 2px;
    position: relative
  }

  .social-count {
    float: left;
    padding: 3.7px 10px;
    font-size: 12px;
    font-weight: 600;
    line-height: 20px;
    color: #24292e;
    vertical-align: middle;
    background-color: #fff;
    border: 1px solid rgba(27, 31, 35, .2);
    border-left: 0;
    border-top-right-radius: 3px;
    border-bottom-right-radius: 3px;
  }

  .Box-header {
    padding: 8px 16px;
    margin: -1px -1px 0;
    background-color: #f6f8fa;
    border: 1px solid #d1d5da;
    border-top-left-radius: 3px;
    border-top-right-radius: 3px;
  }

  .jieshao {
    position: relative;
    top: 2px;
    display: inline-block;
  }

  .Box {
    background-color: #fff;
    border: 1px solid #d1d5da;
    border-radius: 3px;
  }

  .btn:hover {
    background-color: #e6ebf1;
    background-image: linear-gradient(-180deg, #f0f3f6, #e6ebf1 90%);
    background-position: -.5em;
    border-color: rgba(27, 31, 35, .35);
  }

  .d-hover:hover:before {
    content: attr(data-tooltip);
    background-color: black;
    opacity: 0.9;
    color: #fff;
    border-radius: 5px;
    padding: 2px;
    position: absolute;
    top: 25px;
    font-size: 10px;
    z-index: 1000000;
    left: -5px;
    white-space: pre !important;

    display: inline-block;
    text-decoration: none;
    animation-name: tooltip-appear;
    animation-duration: .1s;
    animation-fill-mode: forwards;
    animation-timing-function: ease-in;
    animation-delay: .4s;
  }

</style>
