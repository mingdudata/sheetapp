import axios from 'axios'

export function getUserInfo(token) {
  return axios.get(this.EDIT + "", {
    params: {

    }
  });
}

export function loginByUsername( username, password, edit) {
  return this.$axios.post(edit + "/edit/edit_login", {
    username: username,
    password: password
  });
}
