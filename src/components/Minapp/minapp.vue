<template >
  <div class="contain" style="width: 100%; height: 100%; overflow: hidden" >
    <el-row class="tac" style="height: 100%; width: 100%;">
      <el-col style="height: 100%; width: 280px; background: #FBFBFB" :span="4">
        <el-scrollbar class="el-cala" style="height: 100%">
          <div>
            <views @openiframe="openiframe"/>
          </div>
        </el-scrollbar>
      </el-col>
      <el-col style="position: absolute; left: 280px; height: 100%; " :span="20">
        <iframe id="myIframe" style="height: 100%; width: 100%" frameborder="0" :src="asrc"/>
      </el-col>
    </el-row>
  </div>
</template>

<script>
  import Views from '../Minapp/views'
  import {getToken} from "../../utils/auth";

  export default {
    components: {
      Views
    },
    data() {
      return {
        asrc: "http://180.169.75.199:5007/s/"
      }
    },
    methods: {
      openiframe(src) {
        console.log("33",  src)
        if(src.indexOf("192.168.31.9:8022")) {
          console.log("35")
          const iframe = document.getElementById('myIframe').contentWindow;
          iframe.postMessage(JSON.stringify({
            "id": getToken()
          }), 'http://192.168.31.9:8022');
        }
        this.asrc = src;
      }
    }
  }
</script>
