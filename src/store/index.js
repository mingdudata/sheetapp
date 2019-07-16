import Vue from 'vue'
import Vuex from 'vuex'
import * as action from './actions'
import * as getters from './getters'
import state from './state'
import mutations from './mutations'

Vue.use(Vuex)

export default new Vuex.Store({
  action,
  getters,
  state,
  mutations
})
