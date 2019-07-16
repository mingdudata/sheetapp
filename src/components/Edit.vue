<template>
  <div>
    <div id="x-spreadsheet-demo"></div>
  </div>
</template>

<script>
  import Xspreadsheet from 'x-spreadsheet-master'
  import {mapMutations} from 'vuex'

  export default {
    name: "Edit",
    props: ['sheet_id'],
    data() {
      return {
        refresh: false,
        my_timer: null,
        styles: '',
        data: '',
        options: '',
        trade_code: '',
      }
    },
    mounted() {
      if(this.sheet_id == null || this.sheet_id == undefined) {
        this.$router.push({path: '/home'})
        return;
      }
      this.reqTableData()
    },
    methods: {
      addUrlRelPath(query) {
        query.url_rel_path = "/sec_page/600548"
        return query
      },
      loadSheetData() {
        return new Promise((resolve, reject) => {
          this.$axios.get(this.EDIT + "/edit_find", {
            params: {
              id: this.sheet_id
            }
          }).then(response => {
            resolve(response)
          })
        })
      },
      reqTableData() {
        this.loadSheetData().then(response => {
          this.data = JSON.parse(response.data.sheet_details)
          this.options = JSON.parse(response.data.sheet_options)
          this.styles = JSON.parse(response.data.sheet_styles)
          console.log("53", this.data)
          var d1 = document.getElementById(('x-spreadsheet-demo'));
          var d2 = document.getElementsByClassName('x-spreadsheet')[0];
          if (d1 !== undefined && d2 !== undefined) {
            d1.removeChild(d2);
          }
          console.log("54.....res")
          let xs = new Xspreadsheet('#x-spreadsheet-demo', this.options)
          xs.loadData(
            {
              styles: this.styles,
              rows: this.data,
            }
          ).change(data => {
            let self = this
            clearTimeout(this.my_timer);
            this.my_timer = setTimeout(function () {
              self.refresh = true
              console.log(data, "52")
              self.$axios.post(self.EDIT + "/edit_save", {
                data: JSON.stringify(data.rows),
                trade_code: self.trade_code,
                styles: JSON.stringify(data.styles),
                options: JSON.stringify(self.options),
                id: self.sheet_id
              }).then(res => {
                self.$emit("loadCatalogueData");
              })
            }, 2000)
          });
          xs.validate()
        })
      }
    }
  }
</script>

<style scoped>

</style>
