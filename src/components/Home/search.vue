<template>
  <div>
    <div style="padding: 5px">
      <el-input id="search_input" @focus="focus" @blur="blurInput" @clear="clearInput" @change="changeInput"
                prefix-icon="el-icon-search" v-model="input" clearable placeholder="搜索" ref="input_ref"></el-input>
    </div>
  </div>
</template>

<script>
  export default {
    name: "search",
    data() {
      return {
        input: "",
        timer: null,
        fouce: false,
        clear: false,
      }
    },
    mounted() {
      document.getElementById("search_input").addEventListener("keydown", e => {
        e.stopPropagation();
      });
    },
    watch: {
      input(v) {
        clearTimeout(this.timer);
        this.timer = setTimeout(() => {
          if (this.clear == false) {
            this.$emit('getData2', this.input);
          }
          this.clear = false;
        }, 50)
      }
    },
    methods: {
      focus() {
        this.$emit("setChange");
      },
      changeInput(e) {
        console.log("42")
      },
      clearInput(e) {
        this.$emit('setLabel', 2);
        this.clear = true;
      },
      blurInput(value) {
        this.$emit("getData", this.input)
      },
    }
  }
</script>

<style scoped>

</style>
