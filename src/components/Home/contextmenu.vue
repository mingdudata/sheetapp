<template>
  <div>
    <div v-if="isIssue">
      <v-contextmenu-item disabled>暂无选项</v-contextmenu-item>
    </div>
    <div v-else>
      <v-contextmenu-item @click="issue" v-if="!disableIssue">发布</v-contextmenu-item>
      <v-contextmenu-item @click="createMD" v-if="!disableFile">创建文本文件</v-contextmenu-item>
      <v-contextmenu-item @click="revisions" v-if="!disableFolder">恢复历史版本</v-contextmenu-item>
      <v-contextmenu-item @click="renameFile" v-if="!disableDelete">修改名称</v-contextmenu-item>
      <v-contextmenu-item @click="renameFile" v-if="!disableDelete" divider>修改名称</v-contextmenu-item>
      <v-contextmenu-item @click="removeFile" v-if="!disableRemove">删除</v-contextmenu-item>
    </div>
  </div>
</template>

<script>
  export default {
    name: "contextmenu",
    props: ['disableFile', 'disableFolder', 'disableIssue', 'disableDelete', 'disableRemove', 'isIssue'],
    methods: {
      issue() {
        this.$emit('issue');
      },
      createMD() {
        this.$emit('createMD');
      },
      revisions() {
        this.$emit('revisions');
      },
      renameFile() {
        this.$emit('renameFile');
      },
      removeFile() {
        this.$emit('removeFile');
      }
    }
  }
</script>

<style scoped>

</style>
