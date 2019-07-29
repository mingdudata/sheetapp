import Vue from 'vue'
import Edit from '../../Edit'
let p = "/home";

let edit = (self, {path, id}) => {
  let args = {
    path: path,
    name: id,
    component: Vue.component('edit', {
      data: function () {
        return {
          id: id,
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
      template: '<el-scrollbar :style="style"><Edit :sheet_id="id"  @loadCatalogueData="loadCatalogueData"/> </el-scrollbar>'
    }),
  };
  return args;
};
export {
  edit,
  p
}
