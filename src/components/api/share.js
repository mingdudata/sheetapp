export function shareApi(axios, EDIT, data) {
  const {url, user_id} = data;
  return axios.post(EDIT + "/edit_share_url", {
    url: url,
    user_id: user_id
  });
}

export function likeApi(axios, EDIT, data) {
  let {_id, user_id, cancel} = data;
  return axios.post(EDIT + "/edit_share/like", {
    id: _id,
    user_id: user_id,
    cancel: cancel
  });
}


export function lookApi(axios, EDIT, data) {
  let {_id, user_id} = data;
  return axios.post(EDIT + "/edit_share/look", {
    id: _id,
    user_id: user_id,
  });
}

export function saveApi(axios, EDIT, data) {
  let {_id, user_id} = data;
  return axios.post(EDIT + "/edit_share/save", {
    id: _id,
    user_id: user_id,
  });
}
