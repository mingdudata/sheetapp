import Vue from 'vue'
import Edit from '../../Edit'
import Quill from '../../Home/quill';

let p = "/home";

let edit = (self, {path, id, id2, name}) => {
  let args = {
    path: path,
    name: name,
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
      template: ' <Edit :sheet_id="id" :id2="id2"  @loadCatalogueData="loadCatalogueData"/>  '
    }),
  };
  return args;
};

let qtxt = (self, {path, id, id2, name}) => {
  let args = {
    path: path,
    name: name,
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
      components: {Quill},
      template: ' <Quill :sheet_id="id"   @loadCatalogueData="loadCatalogueData"/>  '
    }),
  };
  return args;
};



export {
  edit,
  p,
  qtxt
}
