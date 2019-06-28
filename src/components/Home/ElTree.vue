<template>
  <div>
    <el-tree :data="data" node-key="id" default-expand-all @node-drag-start="handleDragStart"
             @node-drag-enter="handleDragEnter" @node-drag-leave="handleDragLeave" @node-drag-over="handleDragOver"
             @node-drag-end="handleDragEnd" @node-drop="handleDrop" draggable :allow-drop="allowDrop"
             :allow-drag="allowDrag"   :props="defaultProps"></el-tree>
  </div>
</template>

<script>
  export default {
    props: ['data'],
    mounted() {
      console.log("14...", this.data)
    },
    data() {
      return {
        defaultProps: {
          children: 'childs',
          label: 'alias'
        }
      }
    },
    methods: {
      handleDragStart(node, ev) {
        console.log('drag start', node);
      },
      handleDragEnter(draggingNode, dropNode, ev) {
        console.log('tree drag enter: ', dropNode.label);
      },
      handleDragLeave(draggingNode, dropNode, ev) {
        console.log('tree drag leave: ', dropNode.label);
      },
      handleDragOver(draggingNode, dropNode, ev) {
        console.log('tree drag over: ', dropNode.label);
      },
      handleDragEnd(draggingNode, dropNode, dropType, ev) {
        console.log('tree drag end: ', dropNode && dropNode.label, dropType);
      },
      handleDrop(draggingNode, dropNode, dropType, ev) {
        console.log('tree drop: ', dropNode.label, dropType);
      },
      allowDrop(draggingNode, dropNode, type) {
        if (dropNode.data.label === '二级 3-1') {
          return type !== 'inner';
        } else {
          return true;
        }
      },
      allowDrag(draggingNode) {
        return draggingNode.data.label.indexOf('三级 3-2-2') === -1;
      }
    }
  };
</script>

<style scoped>

</style>
