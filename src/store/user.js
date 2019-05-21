import {getUserInfo} from "../components/api/login";
import {getToken, removeToken, setToken} from "../utils/auth";
import * as types from "./mutation-type";

const user = {
  state: {
    roles: [],
    token: getToken(),
    name: '',
    avatar: '',
    introduction: '',
    loadRouter: false
  },
  actions: {
    GetUserInfo({commit, state}) {
      return new Promise((resolve, reject) => {
        getUserInfo(state.token).then(response => {
          if (!response.data) {  // 由于mockjs 不支持自定义状态码只能这样hack
            reject('error')
          }
          const data = response.data

          if (data.roles && data.roles.length > 0) { // 验证返回的roles是否是一个非空数组
            commit('SET_ROLES', data.roles)
          } else {
            reject('getInfo: roles must be a non-null array !')
          }

          commit('SET_NAME', data.name)
          commit('SET_AVATAR', data.avatar)
          commit('SET_INTRODUCTION', data.introduction)
          resolve(response)
        }).catch(error => {
          reject(error)
        })
      })
    },
    // 前端 登出
    FedLogOut({commit}) {
      return new Promise(resolve => {
        commit('SET_TOKEN', '')
        removeToken()
        resolve()
      })
    },
    LoadRouter({commit}) {
      return new Promise(resolve => {
        commit('LOAD_ROUTER', true)
        resolve()
      })
    }
  },
  mutations: {
    [types.SET_ROLES](state, roles) {
      state.roles = roles
    },
    [types.SET_NAME](state, name) {
      state.name = name
    },
    [types.SET_AVATAR](state, avatar) {
      state.avatar = avatar
    },
    [types.SET_INTRODUCTION](state, introduction) {
      state.introduction = introduction
    },
    [types.SET_TOKEN](state, token) {
      state.token = token
    },
    [types.LOAD_ROUTER](state, loadRouter) {
      state.loadRouter = loadRouter
    }
  }

}

export default user;

