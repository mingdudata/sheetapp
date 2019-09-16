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

export function getOpenFileApi(axios, EDIT, data) {
  const {user_id, file_name} = data;
  return axios.post(EDIT + "/openFile_get", {
    user_id: user_id,
    file_name: file_name
  });
}

export function removeFileApi(axios, EDIT, data) {
  const {_id, file_id, user_id, type, path, path2} = data;
  return axios.post(EDIT + "/remove_file", {
    id: _id,
    file_id: file_id,
    user_id: user_id,
    path: path,
    type: type,
    path2: path2
  });
}



export function changeFileNameApi(axios, EDIT, data) {
  const {_id, name} = data;
  return axios.post(EDIT + "/edit_catalogue/rename", {
    id: _id,
    name: name
  });
}
