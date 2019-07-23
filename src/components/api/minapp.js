export function minappAllApp(axios, EDIT, data) {
  let {input} = data;
  return axios.post(EDIT + "/minapp_all", {
    input: input
  });
}
