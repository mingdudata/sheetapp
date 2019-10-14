<template>
  <div style="height: 100%;" id="quill_id">
    <div class="editor" style="height: 100%;"></div>
  </div>
</template>

<script>
  import Quill from 'quill';
  // import Delta from 'delta'
  import 'quill/dist/quill.snow.css';
  import {wsUrl} from "../config";
  import {p} from "../component/edit/edit_component";
  import {getToken2} from "../../utils/auth";

  export default {
    props: ['sheet_id', 'options', 'editor', 'user_id'],
    data() {
      return {
        quill: null,
        socket: null,
      }
    },
    mounted() {
      let {editor} = this;
      // typeof editor !== 'undefined'
      if (editor === 2) {
        this.options['readOnly'] = true;
      } else if(typeof editor !== 'undefined') {
        this.options['readOnly'] = false;
      }
      let namespace = '/edit_qtxt_message';
      this.socket = new WebSocket(wsUrl + namespace);
      let _this = this;
      this.socket.onopen = function (msg) {
        console.log("32: ", _this.$route);
        let {path} = _this.$route;
        _this.sendMessage({ops: "", id: _this.sheet_id, user_id: _this.user_id != -1 ? _this.user_id :  getToken2('user').id, read: true, url: path.replace(p, '')});
        console.log('WebSocket opened!');
      };
      let self = this;
      this.socket.onmessage = function (message) {
        let res = JSON.parse(message.data);
        if (JSON.stringify(res['qtxt_details']) === "{}") {
          _this.quill.setContents(res['qtxt_details']);
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
             let {path} = this.$route;
          this.sendMessage({ops: JSON.stringify(contents, null, 2),  user_id: this.user_id != -1 ? this.user_id : getToken2('user').id, url: path.replace(p, ''), id: this.sheet_id, read: false});
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
