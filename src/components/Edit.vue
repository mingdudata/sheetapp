<template>
  <div>
    <div id="x-spreadsheet-demo"></div>
  </div>
</template>

<script>
  import Xspreadsheet from 'x-spreadsheet-master'
  import {styles, wlandOption} from "./styles";
  import Sheet from "./core/Sheet"
  import {mapGetters, mapMutations} from 'vuex'
  import {getToken2} from "../utils/auth";

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
        date: 0,
        sh: null,
        mo_time: null,
      }
    },
 computed: {
      ...mapGetters([
        'sheet',
      ])
    },
    mounted() {
      this.mo_time = setTimeout(() => {
        if (this.sheet_id == null || this.sheet_id == undefined) {
        this.$router.push({path: '/home'})
        return;
      }
      this.reqTableData();
      }, 100)
    },
    destroyed() {
      this.axiosArr = [];
      if(this.mo_time) {
        clearTimeout(this.mo_time);
      }
      if(!this.xs) {
        return
      }
      let info = this.xs.getEditorStatus();
      if(this.sheet != null) {
        // 传数据
        let text = this.xs.getText(this.sheet.alias);
        this.sheet.setText(text);
         this.setSheet(this.sheet);

      }
      if(info.status == true && typeof this.sh != 'string') {
        this.sh.setProp(info.ri, info.ci, info.inputText, info.status);
        this.setSheet(this.sh);
      } else {
        this.date = "";
        this.xs.removeEvent();
      }
    },
    methods: {
      ...mapMutations({
        setSheet: "SET_SHEET",
      }),
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
              date: this.date,
              ref: true,
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
      sheetMethods() {
        let methods = {
          axios: this.$axios,
          user_id: getToken2('user').id,
          sheet_id: this.sheet_id,
          async getData(axios, alias, user_id, name, sheet_id) {
             let res = await  axios.post("http://180.169.75.199:5004/edit/edit_find_by_alias", {
              alias: alias,
              user_id: user_id,
              name: name,
              sheet_id: sheet_id
            });

             return res;
          }
        };
        return methods;
      },
      loadRowAndCol(options, neat_flex, op) {
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
          if(op.col) {
            options.col = op.col
          }
          if(op.row) {
            options.row = op.row
          }
        options.showFreeze = true;
        return options;
      },
      reqTableData() {
        this.loadSheetData().then(response => {
          this.sh = (!this.sheet || this.sheet.status  === false) ? new Sheet(this.$route.path) : "";

          if(this.sheet) {
          this.sheet.setAlias(this.$route.name);
          }
            if (response.data.date != this.date) {
              return;
            }
            this.data = typeof response.data.sheet_details == 'string'
              ? JSON.parse(response.data.sheet_details) : response.data.sheet_details;

            if (typeof response.data.sheet_styles === "string" && JSON.parse(response.data.sheet_styles)) {
              this.styles = JSON.parse(response.data.sheet_styles);
            } else {
              this.styles = response.data.sheet_styles
            }
          console.log(response.data);
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
                    if (res.data.enter == "wland" || res.data.enter == "wfr" || res.data.enter == "city") {
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
                }, 100);
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
            this.options = this.loadRowAndCol(this.options, response.data.neat_flex, response.data.sheet_options);
            var d1 = document.getElementById('x-spreadsheet-demo');
            var d2 = document.getElementsByClassName('x-spreadsheet')[0];
            if (d1 !== undefined && d2 !== undefined) {
              this.xs.removeEvent();
              d1.removeChild(d2);
            }

            console.log("..")
            this.xs = new Xspreadsheet('#x-spreadsheet-demo', this.options, this.sheetMethods(), this.$route.name);
            console.log(response.data.sheet_auto_filter);
            this.xs.loadData(
              {
                styles: this.styles,
                rows: this.data,
                merges: response.data.sheet_merges,
                autofilter: response.data.sheet_auto_filter,
                pictures: response.data.sheet_pictures,
                flex: this.loadNeatFlex(response.data.neat_flex)
              }
            ).change(data => {
              let self = this;
              console.log(data);
              clearTimeout(this.my_timer);
              this.my_timer = setTimeout(function () {
                self.refresh = true;
                self.$axios.post(self.EDIT + "/edit_save", {
                  data: JSON.stringify(data.rows),
                  trade_code: self.trade_code,
                  styles: data.styles,
                  options: JSON.stringify(self.options),
                  id: self.sheet_id,
                  merges: data.merges,
                  pictures: data.pictures,
                  autofilter: data.autofilter,
                  id2: self.id2
                }).then(res => {
                  self.$emit("loadCatalogueData");
                })
              }, 200)
            });
             console.log(this.sheet, this.$route);
              if(this.sheet && this.sheet.status === true && this.sheet.name != this.$route.path) {
                console.log(this.xs);
                this.xs.setEditorText();
              } else if(this.sheet && this.sheet.status === true  && this.sheet.name == this.$route.path) {
                this.xs.setTextEnd(this.sheet.inputText, this.sheet.ri, this.sheet.ci);
                this.setSheet(null);
                this.sh = (!this.sheet || this.sheet.status  === false) ? new Sheet(this.$route.path) : "";
              }
          }

        )
      }
    }
  }
</script>

<style scoped>

</style>

