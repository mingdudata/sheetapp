export function openFileRecentlyApi(axios, EDIT, data) {
  const {user_id, file_id} = data;
  return axios.post(EDIT + "/openFileRecently", {
    user_id: user_id,
    file_id: file_id
  })
}


export function getOpenFileRecentlyApi(axios, EDIT, data) {
  const {user_id, file_name} = data;
  return axios.post(EDIT + "/openFileRecently_get", {
    user_id: user_id,
    file_name: file_name
  });
}

export function changeFileNameApi(axios, EDIT, data) {
  const {_id, name} = data;
  return axios.post(EDIT + "/edit_catalogue/rename", {
    id: _id,
    name: name
  });
}
