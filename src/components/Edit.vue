<template>
  <div>
    <div id="x-spreadsheet-demo"></div>
  </div>
</template>

<script>
  import Xspreadsheet from 'x-spreadsheet-master'
  import {styles, wlandOption} from "./styles";

  export default {
    name: "Edit",
    props: ['sheet_id'],
    data() {
      return {
        refresh: false,
        my_timer: null,
        styles: '',
        data: '',
        options: {},
        trade_code: '',
        xs: null,
        date: 0
      }
    },
    mounted() {
      console.log("27...")
      if (this.sheet_id == null || this.sheet_id == undefined) {
        this.$router.push({path: '/home'})
        return;
      }
      this.reqTableData()
    },
    destroyed() {
      this.date = "";
    },
    methods: {
      addUrlRelPath(query) {
        query.url_rel_path = "/sec_page/600548"
        return query
      },
      loadSheetData() {
        this.date = Date.now();
        return new Promise((resolve, reject) => {
          this.$axios.get(this.EDIT + "/edit_find", {
            params: {
              id: this.sheet_id,
              date: this.date
            }
          }).then(response => {
            resolve(response)
          })
        })
      },
      formula(text, rule) {
        if (typeof text !== 'string') {
          return false;
        }
        if (text.toUpperCase().indexOf(rule.toUpperCase()) == -1) {
          return false;
        }
        return true;
      },
      parseFormulaData(data) {
        console.log("47", data)
        Object.keys(data).forEach(i => {
          // console.log(data[i], "49");
          Object.keys(data[i]).forEach(i2 => {
            Object.keys(data[i][i2]).forEach(i3 => {
              if (this.formula(data[i][i2][i3].text, "wland")) {

              }
            })
          })
        })
      },
      diff(obj1, obj2) {
        return JSON.stringify(obj1) == JSON.stringify(obj2);
      },
      loadNeatFlex(neat_flex) {
        if (neat_flex) {
          return neat_flex.neat_flex;
        }
        return {};
      },
      loadRowAndCol(options, neat_flex) {
        if (neat_flex) {
          options.row = {
            len: neat_flex["rows"],
          };

          options.col = {
            len: neat_flex["col"],
          };
        }

        return options;
      },
      reqTableData() {
        this.loadSheetData().then(response => {
            console.log(response.data.date, this.date);
            if(response.data.date != this.date) {
              return;
            }
            this.data = typeof response.data.sheet_details == 'string'
              ? JSON.parse(response.data.sheet_details) : response.data.sheet_details;

            console.log(response, 78)
            // this.options = typeof response.data.sheet_options == 'string'
            //   ? JSON.parse(response.data.sheet_options) : response.data.sheet_options;
            if (JSON.stringify(response.data.sheet_styles) == "{}") {
              this.styles = styles;
            }
            this.options.formula = {
              id: this.sheet_id,
              axios: this.$axios,
              data: this.data,
              diff: this.diff,
              timer: null,
              styles: styles,
              wland(formula, data, table) {
                clearTimeout(formula.timer);
                formula.timer = setTimeout(() => {
                  formula.axios.post("http://192.168.31.33:5010/edit/edit_find", {
                    id: formula.id
                  }).then(res => {
                    if (res.data.enter == "wland" || res.data.enter == "wfr") {
                      let args = {};
                      if (JSON.stringify(res.data.sheet_styles) == "{}") {
                        args['styles'] = formula.styles;
                      }

                      args['rows'] = typeof res.data.sheet_details == 'string'
                        ? JSON.parse(res.data.sheet_details) : res.data.sheet_details;
                      args['flex'] = res.data.neat_flex ? res.data.neat_flex.neat_flex : {};
                      data.setData(args);
                      table.render();
                    }
                  })
                }, 500);
              }
            };
            this.options = this.loadRowAndCol(this.options, response.data.neat_flex);
            // this.options = wlandOption;
            var d1 = document.getElementById(('x-spreadsheet-demo'));
            var d2 = document.getElementsByClassName('x-spreadsheet')[0];
            if (d1 !== undefined && d2 !== undefined) {
              d1.removeChild(d2);
            }

            let xs = new Xspreadsheet('#x-spreadsheet-demo', this.options);
            xs.loadData(
              {
                styles: this.styles,
                rows: this.data,
                flex: this.loadNeatFlex(response.data.neat_flex)
              }
            ).change(data => {
              let self = this;
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
              }, 500)
            });
            xs.validate()
          }
        )
      }
    }
  }
</script>

<style scoped>

</style>
