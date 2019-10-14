import Vue from 'vue'
import Edit from '../../Edit'
import Quill from '../../Home/quill';

let p = "/home";

let edit = (self, {path, id, id2, name, editor}) => {
  let args = {
    path: path,
    name: name,
    component: Vue.component('edit', {
      data: function () {
        return {
          id: id,
          id2: id,
          editor: editor,
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
      template: ' <Edit :sheet_id="id" :id2="id2" :editor="editor"  @loadCatalogueData="loadCatalogueData"/>  '
    }),
  };
  return args;
};

let ops = {
  theme: 'snow',
  modules: {
    toolbar: [
      ['bold', 'italic', 'underline', 'strike'],
      ['blockquote', 'code-block'],
      [{'header': 1}, {'header': 2}],
      [{'list': 'ordered'}, {'list': 'bullet'}],
      [{'script': 'sub'}, {'script': 'super'}],
      [{'indent': '-1'}, {'indent': '+1'}],
      [{'direction': 'rtl'}],
      [{'size': ['small', false, 'large', 'huge']}],
      [{'header': [1, 2, 3, 4, 5, 6, false]}],
      [{'color': []}, {'background': []}],
      [{'font': []}],
      [{'align': []}],
      ['clean'],
      ['link', 'image', 'video']
    ]
  },
  placeholder: '由此输入 ...'
};
let qtxt = (self, {path, id, name, editor}, options = ops, user_id = -1) => {
  let args = {
    path: path,
    name: name,
    component: Vue.component('edit', {
      data: function () {
        return {
          id: id,
          id2: id,
          options: options,
          editor: editor,
          user_id: user_id,
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
      template: ' <Quill :options="options" :user_id="user_id" :sheet_id="id" :editor="editor"   @loadCatalogueData="loadCatalogueData"/>  '
    }),
  };
  return args;
};


export {
  edit,
  p,
  qtxt
}
