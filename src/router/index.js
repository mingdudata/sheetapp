import Vue from 'vue'
import Router from 'vue-router'
import Edit from '../components/Edit'
import Login from '../components/Login/login'
import Home from '../components/Home/home'
import Document from '../components/Home/document'
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
  },
  {
    path: '/document',
    component: Document,
  }
];
export {constantRouterMap}

export default new Router({
  routes: constantRouterMap
})
