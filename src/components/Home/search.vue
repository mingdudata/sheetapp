<template>
  <div>
    <div style="padding: 5px">
      <el-input @blur="blurInput" @clear="clearInput"
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
      }
    },
    watch: {
      input(v) {
        setTimeout(this.timer);
        this.timer = setTimeout(() => {
          console.log("21xx", this.timer)
          this.$emit('getData', this.input)
        }, 50)
      }
    },
    methods: {
      changeInput() {
        console.log("changeInput")
      },
      clearInput(e) {
      },
      blurInput(value) {
        this.$emit("getData", this.input)
      },
    }
  }
</script>

<style scoped>

</style>
