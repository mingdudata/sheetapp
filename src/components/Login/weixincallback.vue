<template>
  <div>
    请稍后。。。
  </div>
</template>

<script>
  import {loginByWeixin} from "../api/login";
  import {setToken, setToken2} from "../../utils/auth";
  import {mapGetters, mapMutations} from 'vuex'

  export default {
    beforeMount() {
      if (!this.$route.query.code) {
        window.close();
      }

      loginByWeixin(this.$axios, this.EDIT, {code: this.$route.query.code}).then(res => {
        setToken2("wxuser", res.data.data);
        setToken(res.data.data.nickname);
        window.close();
      });
    },
    computed: {
      ...mapGetters([
        'wxwindow',
      ])
    },
  }
</script>

<style scoped>

</style>
