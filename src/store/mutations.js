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
  },
  [types.SET_WX_WINDOW](state, name) {
    state.wxwindow = name;
  },
  [types.SET_SHEET](state, name) {
    state.sheet = name;
  },
  [types.SET_XS](state, name) {
    state.xs = name;
  }
}

export default mutations
