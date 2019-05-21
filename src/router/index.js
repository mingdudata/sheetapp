import Vue from 'vue'
import Router from 'vue-router'
import Edit from '../components/Edit'
import Login from '../components/Login/login'
import Home from '../components/Home/home'
Vue.use(Router)


let constantRouterMap = [
  {
    //登录
    path: '/login',
    component: Login,
  },
  {
    path: '/home',
    component: Home,
    children: [],
  }
]
export {constantRouterMap}

export default new Router({
  routes: constantRouterMap
})
