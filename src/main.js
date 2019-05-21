// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import 'element-ui/lib/theme-chalk/index.css'
import Vue from 'vue'
import App from './App'
import router, {constantRouterMap} from './router'
import axios from 'axios'
import store from './store'
import {getToken} from './utils/auth'
import Element from 'element-ui'

Vue.config.productionTip = false

Vue.prototype.HOST = '/api'
Vue.prototype.EDIT = 'http://192.168.31.33:5010/edit'
Vue.prototype.$axios = axios;
Vue.use(Element)

router.beforeEach((to, from, next) => {
  if (getToken()) {
    if (to.path == '/login') {
      next('/home')
    } else {
      if (to.path != "/home" && constantRouterMap[1].children.length <= 0) {
        console.log("26")
        next('/home')
      } else {
        next()
      }
      // })
      // next()
    }
  } else {
    if (to.path == '/login') { //如果是登录页面路径，就直接next()
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

