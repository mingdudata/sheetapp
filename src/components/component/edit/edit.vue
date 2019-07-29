<template>
  <div>
    <el-scrollbar style="height: 100%;">
      <Edit :sheet_id="id" @loadCatalogueData="loadCatalogueData"/>
    </el-scrollbar>
  </div>
</template>

<script>
  import Edit from './edit'

  export default {
    name: "edit",
    components: {
      Edit
    }
  }
</script>

<style scoped>

</style>
