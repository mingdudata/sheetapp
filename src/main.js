// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
// import 'element-ui/lib/theme-chalk/index.css'
import Vue from 'vue'
import App from './App'
import router, {constantRouterMap} from './router'
import axios from 'axios'
import store from './store'
import 'element-ui/lib/theme-chalk/index.css';
import {getToken, setToken, setToken2 ,getToken2} from './utils/auth'
import Element from 'element-ui'
import contentmenu from 'v-contextmenu'
import 'v-contextmenu/dist/index.css'
import {loginByWeixin} from "./components/api/login";
import Edit from './components/component/edit'
 import './axios_config'
Vue.use(Edit);
Vue.use(contentmenu);
Vue.config.productionTip = false

Vue.prototype.HOST = '/api'
Vue.prototype.EDIT = 'http://180.169.75.199:5004/edit';
Vue.prototype.$axios = axios;
Vue.use(Element)

router.beforeEach((to, from, next) => {
  if (getToken2("user")) {
    if (to.path == '/weixincallback') {
      next('/home')
    } else if (to.path == '/login') {
      next('/home')
    } else {
      if (to.path != "/home" && to.path != "/document" && constantRouterMap[1].children.length <= 0) {
        next({
          path: '/home',
          query: {
            redirect: to.fullPath
          }
        });
        store.commit('SET_ACTIVE_INDEX', to.fullPath)
      } else {
        next()
      }
    }
  } else {
    if (to.path == '/weixincallback') {
      if(to.query) {
        setToken2("user", to.query);
        setToken(to.query.nickname);
      }
      window.close()
    } else if (to.path == '/login') { //如果是登录页面路径，就直接next()
      next();
    } else { //不然就跳转到登录；
      next('/login');
    }
  }
});

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  components: {App},
  template: '<App/>'
})

