import Vue from 'vue'
import Edit from '../../Edit'
let p = "/home";

let edit = (self, {path, id, id2}) => {
  let args = {
    path: path,
    name: id + id2,
    component: Vue.component('edit', {
      data: function () {
        return {
          id: id,
          id2: id,
          style: {
            height: document.documentElement.clientHeight + "px"
          }
        }
      },
      methods: {
        loadCatalogueData() {
          self.loadCatalogueData();
        }
      },
      components: {Edit},
      template: ' <Edit :sheet_id="id" :id2="id2"  @loadCatalogueData="loadCatalogueData"/> </el-scrollbar>'
    }),
  };
  return args;
};
export {
  edit,
  p
}
