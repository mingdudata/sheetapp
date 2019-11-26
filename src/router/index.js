import Vue from 'vue'
import Router from 'vue-router'
import Edit from '../components/Edit'
import Login from '../components/Login/login'
import Home from '../components/Home/home'
import Document from '../components/Home/document'
// import WeiXinCallBack from '../components/Login/weixincallback'
import Share from '../components/share/share';
Vue.use(Router);

// const Edit = () => import("../components/Edit");
// const Login = () => import("../components/Login/login");
// const Home = () => import("../components/Home/home");
// const Document = () => import("../components/Home/document");
// const WeiXinCallBack = () => import("../components/Login/weixincallback");
// const Share = () => import("../components/share/share");


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
  },
  {
    path: '/share',
    component: Share,
    children: [],
  },
];
export {constantRouterMap}

export default new Router({
  mode: 'history',
  base: "sheetapp",
  routes: constantRouterMap
})
