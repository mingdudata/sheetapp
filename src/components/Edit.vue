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
    props: ['sheet_id', 'id2'],
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
      if (this.sheet_id == null || this.sheet_id == undefined) {
        this.$router.push({path: '/home'})
        return;
      }
      this.reqTableData()
    },
    destroyed() {
      this.date = "";
      this.xs.removeEvent();
      console.log(this.xs,);
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
          options.rowWidth = {
            state: !0,
            width: 240
          };
          options.view = {
            height: () => 150 * 25,
          };
          options.col = {
            len: neat_flex["col"],
          };
        }
        options.view = {
          width: () => {
            return document.body.clientWidth - 280 - 10 - 68;
          }
        };
        options.showFreeze = true;
        return options;
      },
      reqTableData() {
        this.loadSheetData().then(response => {
            console.log(response.data.date, this.date);
            if (response.data.date != this.date) {
              return;
            }
            this.data = typeof response.data.sheet_details == 'string'
              ? JSON.parse(response.data.sheet_details) : response.data.sheet_details;

            if (typeof response.data.sheet_styles === "string" && JSON.parse(response.data.sheet_styles) ) {
              this.styles = JSON.parse(response.data.sheet_styles);
            } else {
              this.styles = response.data.sheet_styles
            }
            console.log(this.styles)
            this.options.formula = {
              id: this.sheet_id,
              axios: this.$axios,
              data: this.data,
              diff: this.diff,
              timer: null,
              timer2: null,
              styles: styles,
              wland(formula, data, table) {
                clearTimeout(formula.timer);
                clearTimeout(formula.timer2);
                formula.timer = setTimeout(() => {
                  formula.axios.post("http://180.169.75.199:5004/edit/edit_find", {
                    id: formula.id,
                    date: Date.now() + parseInt(Math.random() * 9999)
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
                }, 1000);
                let d = Date.now() + parseInt(Math.random() * 9999);
                setTimeout(() => {
                  formula.axios.post("http://180.169.75.199:5004/edit/edit_find", {
                    id: formula.id,
                    date: d
                  }).then(res => {
                    if (res.data.enter == "rtd" && res.data.date === d) {
                      let args = {};
                      if (JSON.stringify(res.data.sheet_styles) == "{}") {
                        args['styles'] = formula.styles;
                      }

                      args['rows'] = typeof res.data.sheet_details == 'string'
                        ? JSON.parse(res.data.sheet_details) : res.data.sheet_details;
                      args['flex'] = res.data.neat_flex ? res.data.neat_flex.neat_flex : {};
                      data.setData(args);
                      table.render();
                    } else {
                      clearInterval(formula.timer2);
                    }
                    d = Date.now() + parseInt(Math.random() * 9999);
                  });
                }, 500);

                formula.timer2 = setInterval(() => {
                  formula.axios.post("http://180.169.75.199:5004/edit/edit_find", {
                    id: formula.id,
                    date: d
                  }).then(res => {
                    console.log(res.data.enter)
                    if (res.data.enter == "rtd" && res.data.date === d) {
                      let args = {};
                      if (JSON.stringify(res.data.sheet_styles) == "{}") {
                        args['styles'] = formula.styles;
                      }

                      args['rows'] = typeof res.data.sheet_details == 'string'
                        ? JSON.parse(res.data.sheet_details) : res.data.sheet_details;
                      args['flex'] = res.data.neat_flex ? res.data.neat_flex.neat_flex : {};
                      data.setData(args);
                      table.render();
                    } else {
                      clearInterval(formula.timer2);
                    }
                    d = Date.now() + parseInt(Math.random() * 9999);
                  })
                }, 3000);
              }
            };
            this.options = this.loadRowAndCol(this.options, response.data.neat_flex);
            // this.options = wlandOption;
            var d1 = document.getElementById('x-spreadsheet-demo');
            // var d1 = document.getElementById('sheetapp');
            var d2 = document.getElementsByClassName('x-spreadsheet')[0];
            if (d1 !== undefined && d2 !== undefined) {
              this.xs.removeEvent();
              d1.removeChild(d2);
            }
            //d1.removeChild(d1.firstChild);
            //var d2 = document.createElement("div");
            //d2.setAttribute("id", "x-spreadsheet-demo");
            //d1.appendChild(d2);

            this.xs = new Xspreadsheet('#x-spreadsheet-demo', this.options);
            this.xs.loadData(
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
                console.log(data, self.id2, "52")
                self.$axios.post(self.EDIT + "/edit_save", {
                  data: JSON.stringify(data.rows),
                  trade_code: self.trade_code,
                  styles: data.styles,
                  options: JSON.stringify(self.options),
                  id: self.sheet_id,
                  id2: self.id2
                }).then(res => {
                  self.$emit("loadCatalogueData");
                })
              }, 500)
            });
            this.xs.validate()
          }
        )
      }
    }
  }
</script>

<style scoped>

</style>
