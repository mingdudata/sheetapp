import * as types from './mutation-type'
import Vue from 'vue'
import qs from 'qs'
import axios from 'axios'

const mutations = {
  [types.SET_ACTIVE_INDEX](state, name) {
    state.active_index = name;
  },
  [types.SET_ENTITY](state, name) {
    state.entity = name;
  },
  [types.SET_MENU_DATA](state, name) {
    state.menuData = name;
  }
}

export default mutations
