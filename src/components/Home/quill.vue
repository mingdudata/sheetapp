<template>
  <div style="height: 100%;">
    <div class="editor" style="height: 100%;"></div>
  </div>
</template>

<script>
  import Quill from 'quill';
  import Delta from 'delta'
  import 'quill/dist/quill.snow.css';

  export default {
    props: ['sheet_id' ],
    data() {
      return {
        quill: null,
        socket: null,
        options: {
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
          placeholder: 'Insert text here ...'
        }
      }
    },
    mounted() {
      let namespace = '/edit_qtxt_message';
      this.socket = new WebSocket("ws://180.169.75.199:5004/edit" + namespace);
      let _this = this;
      this.socket.onopen = function (msg) {
        _this.sendMessage({ops: "",  id: _this.sheet_id, read: true });
        console.log('WebSocket opened!');
      };
      let self = this;
      this.socket.onmessage = function (message) {
         let res = JSON.parse(message.data);
         if(JSON.stringify(res['qtxt_details']) === "{}") {
            _this.quill.setContents( res['qtxt_details'] );
         } else {
           _this.quill.setContents(JSON.parse(res['qtxt_details']));
         }
      };
      this.socket.onerror = function (error) {
        console.log('Error: ' + error.name + error.number);
      };
      this.socket.onclose = function (e) {
        console.log('WebSocket closed!' + e.code + ' ' + e.reason + ' ' + e.wasClean);
      };
      this.initQuill();
    },
    methods: {
      initQuill() {
        let dom = this.$el.querySelector('.editor')
        this.quill = new Quill(dom, this.options);
        var ops = [
          {insert: 'abc'},
          {
            insert: {image: 'https://ss0.baidu.com/73F1bjeh1BF3odCf/it/u=3560137830,3531174186&fm=85&s=F4187E9F510173475A515CFD0300907A'},
            attributes: {alt: "Lab Octocat"}
          },
          {retain: 1, attributes: {color: 'red'}},
          {delete: 4},
          {insert: 'def', attributes: {bold: true}},
          {retain: 6},
        ];
       // this.quill.setContents(ops)
        this.quill.on('text-change', () => {
          let contents = this.quill.getContents();
          this.sendMessage({ops: JSON.stringify(contents, null, 2),  id: this.sheet_id, read: false });
          // this.$emit('input', delta)
        });
      },
      sendMessage(obj) {
         let self = this;
         self.socket.send(JSON.stringify(obj));
      }
    }
  }
</script>

<style scoped>

</style>
