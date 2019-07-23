export function userappApi(axios, EDIT, data) {
  let {user_id} = data;
  return axios.post(EDIT + "/userapp", {
    user_id: user_id
  });
}


export function insertUserappApi(axios, EDIT, data) {
  let {user_id, app_id} = data;
  return axios.post(EDIT + "/userapp_insert", {
    user_id: user_id,
    app_id: app_id
  });
}
