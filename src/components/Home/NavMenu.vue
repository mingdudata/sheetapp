<template>
  <div class="navMenu">

    <template v-for="navMenu in navMenus">
      <!-- 最后一级菜单 -->
      <el-menu-item v-if="!navMenu.childs&&navMenu.entity && navMenu.entity.alias != 'hide'"
                    :key="navMenu.entity.id" :data="navMenu" :index="'/home' + navMenu.entity.path + ''">
        <div @contextmenu.prevent="rightShow">
          <i :class="navMenu.entity.icon"></i>
          <span slot="title">{{navMenu.entity.alias}}</span>
        </div>
      </el-menu-item>

      <!-- 此菜单下还有子菜单 -->
      <el-submenu v-if="navMenu.childs&&navMenu.entity" :key="navMenu.entity.id" :data="navMenu"
                  :index="'/home' + navMenu.entity.path + ''">
        <template slot="title">
          <i :class="navMenu.entity.icon"></i>
          <span> {{navMenu.entity.alias}}</span>
        </template>
        <!-- 递归 -->
        <NavMenu :navMenus="navMenu.childs"></NavMenu>
      </el-submenu>
    </template>
  </div>
</template>

<script>
  export default {
    name: 'NavMenu',
    props: ['navMenus'],
    data() {
      return {
        show: false
      }
    },
    methods: {
      rightShow() {
        this.show = !this.show
      }
    }
  }
</script>

<style>

</style>
