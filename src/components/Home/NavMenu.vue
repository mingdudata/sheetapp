<template>
  <div class="navMenu">
    <template v-for="navMenu in navMenus">
      <!-- 最后一级菜单 -->
      <el-menu-item style="padding-left: 28px" v-if="!navMenu.childs&&navMenu.entity && navMenu.entity.alias != 'hide'"
                      :key="navMenu.entity.id" :data="navMenu" :index="'/home' + navMenu.entity.path + ''">
        <div @contextmenu.prevent="rightShow(navMenu.entity)">
          <i :class="navMenu.entity.icon"></i>
          <span slot="title" style="  width: 72%;overflow: hidden;text-overflow:ellipsis;white-space: nowrap; display: inline-block">{{navMenu.entity.alias}}</span>
          <div style="display: inline-block; position: absolute; right: 20px ; ">
            <span style="position: relative; top: 5px; font-size: 12px; color: rgb(169, 169, 169);  ">
            {{navMenu.entity.sheet.date}}
          </span>
          </div>
        </div>
      </el-menu-item>

      <!-- 此菜单下还有子菜单 -->
      <el-submenu v-if="navMenu.childs&&navMenu.entity" :key="navMenu.entity.id" :data="navMenu"
                  :index="'/home' + navMenu.entity.path + ''">
        <template  slot="title">
          <div style="position: relative; left: -11px" @contextmenu.prevent="rightShow(navMenu.entity)">
            <i :class="navMenu.entity.icon"></i>
            <span> {{navMenu.entity.alias}}</span>
          </div>
        </template>
        <!-- 递归 -->
        <NavMenu :navMenus="navMenu.childs"></NavMenu>
      </el-submenu>
    </template>
  </div>
</template>

<script>
  import {mapMutations, mapGetters} from 'vuex'

  export default {
    name: 'NavMenu',
    props: ['navMenus'],
    data() {
      return {
        show: false
      }
    },
    computed: {
      ...mapGetters([
        'entity',
      ])
    },
    methods: {
      ...mapMutations({
        setEntity: "SET_ENTITY"
      }),
      rightShow(entity) {
        console.log("48", entity)
        this.setEntity(entity);
      }
    }
  }
</script>

<style>

</style>
