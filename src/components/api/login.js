export function loginByWeixin(axios, EDIT, data) {
  let {code} = data;
  return axios.post(EDIT + "/wx/login", {
    code: code
  });
}
