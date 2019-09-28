export function addQTxtApi(axios, EDIT, data) {
  const {alias, folder_type, user_id, path} = data;

  return axios.post(EDIT + "/edit_catalogue/add_qtxt", {
    alias: alias,
    folder_type: folder_type,
    user_id: user_id,
    path: path,
  });
}

