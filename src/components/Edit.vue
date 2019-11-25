<template>
  <div>
    <div id="x-spreadsheet-demo"></div>
  </div>
</template>

<script>
  import {p} from "./component/edit/edit_component";
  import Spreadsheet from 'financial-cell'
  import {styles, wlandOption} from "./styles";
  import Sheet from "./core/Sheet"
  import {mapGetters, mapMutations} from 'vuex'
  import {getToken2} from "../utils/auth";
  import {revisionsApi} from "./api/folder";
  import {wsUrl} from "./config";

  export default {
    props: ['sheet_id', 'id2', 'editor'],
    data() {
      return {
        refresh: false,
        my_timer: null,
        styles: '',
        data: '',
        options: {},
        trade_code: '',
        date: 0,
        sh: null,
        mo_time: null,
        mo_time2: null,
        topId: "",
        socket: null,
        editing: 0,
      }
    },
    computed: {
      ...mapGetters([
        'sheet',
        'xs',
      ])
    },
    mounted() {
      this.mo_time = setTimeout(() => {
        if (this.sheet_id == null || this.sheet_id === undefined) {
          this.$router.push({path: '/home'});
          return;
        }
        this.reqTableData();
      }, 500)
    },
    created() {
      this.mo_time2 = setTimeout(() => {
        let namespace = '/edit_message';
        this.socket = new WebSocket(wsUrl + namespace);
        this.socket.onopen = function (msg) {
          console.log('WebSocket opened!');
        };
        let self = this;
        this.socket.onmessage = function (message) {
          // console.log('receive message: ' + message.data);
          self.editing = self.editing - 1;
          if (self.editing <= 0) {
            let res = JSON.parse(message.data);
            if (typeof res !== 'object') {
              return;
            }
            if (res.enter == "wland" || res.enter == "wfr" || res.enter == "city") {
              let args = {};
              if (JSON.stringify(res.sheet_styles) == "{}") {
                args['styles'] = formula.styles;
              }

              args['rows'] = typeof res.sheet_details == 'string'
                ? JSON.parse(res.sheet_details) : res.sheet_details;
              args['flex'] = res.neat_flex ? res.neat_flex.neat_flex : {};
              // data.setData(args);
              self.xs.data.setData(args,self.xs.sheet, true);
              let {recalc, table} = self.xs.sheet.getTable();
              if (recalc === false) {
                table.proxy.diff = 306;
                // table.proxy.processBackEnd();
                table.render();
              }
            }
          }
        };
        this.socket.onerror = function (error) {
          console.log('Error: ' + error.name + error.number);
        };
        this.socket.onclose = function (e) {
          console.log('WebSocket closed!' + e.code + ' ' + e.reason + ' ' + e.wasClean);
        };
      }, 500)
    },
    destroyed() {
      this.axiosArr = [];

      clearTimeout(this.mo_time);
      clearTimeout(this.mo_time2)

      // if (!this.xs) {
      //   return
      // }
      // let info = this.xs.getEditorStatus();
      // if (this.sheet != null) {
      //   // 传数据
      //   let text = this.xs.getText(this.sheet.alias, this.sheet.inputText,
      //     this.sheet.pos);
      //   this.sheet.setText(text);
      //   this.setSheet(this.sheet);
      // }
      //
      // if (info.status == true && typeof this.sh != 'string') {
      //   this.sh.setProp(info.ri, info.ci, info.inputText, info.status, info.pos);
      //   this.setSheet(this.sh);
      // } else {
      //   this.date = "";
      //   this.xs.removeEvent();
      // }
    },
    methods: {
      ...mapMutations({
        setSheet: "SET_SHEET",
        setXs: "SET_XS"
      }),
      addUrlRelPath(query) {
        query.url_rel_path = "/sec_page/600548"
        return query
      },
      loadSheetData() {
        this.date = Date.now();
        let {path} = this.$route;
        return new Promise((resolve, reject) => {
          this.$axios.get(this.EDIT + "/edit_find", {
            params: {
              id: this.sheet_id,
              date: this.date,
              ref: true,
              path: path.replace(p, ''),
              user_id: getToken2('user').id,
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
            let res = await axios.post("http://192.168.31.9:5018/edit/edit_find_by_alias", {
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
      editMessage(data, trade_code, styles, options, id, merges, pictures, autofilter, id2) {
        let {path} = this.$route;
        let self = this;
        let copyPath = path.replace(p, '');
        let user_id = getToken2('user').id;
        let obj = {data, trade_code, user_id, path: copyPath, styles, options, id, merges, pictures, autofilter, id2};
        self.editing = self.editing + 1;
        self.socket.send(JSON.stringify(obj));
        if (this.topId !== this.id2) {
          self.$emit("loadCatalogueData");
          this.topId = self.id2;
        }
      },
      editFind() {

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
        if (typeof op === 'string') {
          op = JSON.parse(op)
        }
        if (op.cols) {
          options.cols = op.cols
        }
        if (op.row) {
          options.row = op.row
        }
        options.showFreeze = true;
        return options;
      },
      haveRevisions() {
        console.log(this.$route);
        let {query} = this.$route;
        if (query.revision && query.revision === true) {
          setTimeout(() => {
            this.revisionOpen(query._id);
          }, 800);
        }
      },
      revisionOpen(id) {
        let args = {
          _id: id,
        };
        revisionsApi(this.$axios, this.EDIT, args).then(res => {
          if (!res.data.state) {
            this.$message({message: res.data.message, type: 'error', showClose: true});
          } else {

            if (res.data.data === "error") {
              return;
            }
            let data = typeof res.data.data.sheet_details == 'string'
              ? JSON.parse(res.data.data.sheet_details) : res.data.data.sheet_details;
            let styles = "";
            if (typeof res.data.data.sheet_styles === "string" && JSON.parse(res.data.data.sheet_styles)) {
              styles = JSON.parse(res.data.data.sheet_styles);
            } else {
              styles = res.data.data.sheet_styles;
            }
            let options = this.loadRowAndCol({}, res.data.data.neat_flex, res.data.data.sheet_options);
            args = {
              styles: styles,
              rows: data,
              options: options,
              merges: res.data.data.sheet_merges,
              autofilter: res.data.data.sheet_auto_filter,
              pictures: res.data.data.sheet_pictures,
              flex: this.loadNeatFlex(res.data.data.neat_flex),
              cols: (options && options.cols) || {}
            };
            this.xs.plugIn.openFrame(() => {
              return document.body.clientWidth - 280 - 68
            }, res.data.message, args, {
              axios: this.$axios,
              url: this.EDIT + "/edit_versions/find"
            }, this);
          }
        });
      },
      reqTableData() {
        this.loadSheetData().then(response => {
            this.haveRevisions();
            if (response.data === "error") {
              return;
            }

            this.sh = (!this.sheet || this.sheet.status === false) ? new Sheet(this.$route.path) : "";

            if (this.sheet) {
              console.log(this.$route);
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

            this.options.formula = {
              id: this.sheet_id,
              axios: this.$axios,
              data: this.data,
              diff: this.diff,
              timer: null,
              timer2: null,
              styles: styles,
              wland(formula, data, table, recalc = false) {
                if (!recalc) {
                  return;
                }
                clearTimeout(formula.timer);
                clearTimeout(formula.timer2);
                formula.timer = setTimeout(() => {
                  formula.axios.post("http://180.169.75.199:5004/edit/edit_find", {
                    id: formula.id,
                    date: Date.now() + parseInt(Math.random() * 9999),
                    recalc: recalc
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
                      if (recalc === false) {
                        table.proxy.diff = 306;
                        // table.proxy.processBackEnd();
                        table.render();
                      }
                    }
                    if (recalc) {
                      table.proxy.diff = 306;
                      // table.proxy.processBackEnd();
                      table.render();
                    }
                  })
                }, 500);  // 有个问题， edit_find在edit_save之前执行完
                // let d = Date.now() + parseInt(Math.random() * 9999);
                // setTimeout(() => {
                //   formula.axios.post("http://180.169.75.199:5004/edit/edit_find", {
                //     id: formula.id,
                //     date: d
                //   }).then(res => {
                //     if (res.data.enter == "rtd" && res.data.date === d) {
                //       let args = {};
                //       if (JSON.stringify(res.data.sheet_styles) == "{}") {
                //         args['styles'] = formula.styles;
                //       }
                //
                //       args['rows'] = typeof res.data.sheet_details == 'string'
                //         ? JSON.parse(res.data.sheet_details) : res.data.sheet_details;
                //       args['flex'] = res.data.neat_flex ? res.data.neat_flex.neat_flex : {};
                //       data.setData(args);
                //       table.render();
                //     } else {
                //       clearInterval(formula.timer2);
                //     }
                //     d = Date.now() + parseInt(Math.random() * 9999);
                //   });
                // }, 500);

                // formula.timer2 = setInterval(() => {
                //   formula.axios.post("http://180.169.75.199:5004/edit/edit_find", {
                //     id: formula.id,
                //     date: d
                //   } ).then(res => {
                //     console.log(res.data.enter)
                //     if (res.data.enter == "rtd" && res.data.date === d) {
                //       let args = {};
                //       if (JSON.stringify(res.data.sheet_styles) == "{}") {
                //         args['styles'] = formula.styles;
                //       }
                //
                //       args['rows'] = typeof res.data.sheet_details == 'string'
                //         ? JSON.parse(res.data.sheet_details) : res.data.sheet_details;
                //       args['flex'] = res.data.neat_flex ? res.data.neat_flex.neat_flex : {};
                //       data.setData(args);
                //       table.render();
                //     } else {
                //       clearInterval(formula.timer2);
                //     }
                //     d = Date.now() + parseInt(Math.random() * 9999);
                //   })
                // }, 3000);
              }
            };
            this.options = this.loadRowAndCol(this.options, response.data.neat_flex, response.data.sheet_options);
            var d1 = document.getElementById('x-spreadsheet-demo');
            var d2 = document.getElementsByClassName('x-spreadsheet')[0];
            if (d1 !== undefined && d2 !== undefined) {
              this.xs.removeEvent();
              d1.removeChild(d2);
            }

            let xs = x.spreadsheet('#x-spreadsheet-demo', this.options, this.sheetMethods, this.$route.name);
            this.setXs(xs);

            this.xs.loadData(
              {
                styles: this.styles,
                rows: this.data,
                merges: response.data.sheet_merges,
                autofilter: response.data.sheet_auto_filter,
                pictures: response.data.sheet_pictures,
                flex: this.loadNeatFlex(response.data.neat_flex),
                refRow: response.data.sheet_refRow,
                cols: (this.options && this.options.cols) || {}
              }
            ).change(data => {
              if (data.editor === false) {

              } else if (data.ref && data.ref == true) {
                if (data.data.length > 0) {
                  this.$axios.post(this.EDIT + "/edit_ref_save", {
                    data: data.data,
                  });
                }
              } else {
                let self = this;
                console.log(data);
                clearTimeout(this.my_timer);
                delete self.options['formula'];
                self.options['row'] = {
                  'len': data.rows['len']
                };

                self.options['cols'] = data.cols;

                this.my_timer = setTimeout(function () {
                  self.refresh = true;
                  self.editMessage(
                    JSON.stringify(data.rows),
                    self.trade_code,
                    data.styles,
                    JSON.stringify(self.options),
                    self.sheet_id,
                    data.merges,
                    data.pictures,
                    data.autofilter,
                    self.id2
                  );
                  // self.$axios.post(self.EDIT + "/edit_save", {
                  //   data: JSON.stringify(data.rows),
                  //   trade_code: self.trade_code,
                  //   styles: data.styles,
                  //   options: JSON.stringify(self.options),
                  //   id: self.sheet_id,
                  //   merges: data.merges,
                  //   pictures: data.pictures,
                  //   autofilter: data.autofilter,
                  //   id2: self.id2
                  // }).then(res => {
                  //   if(this.topId !== this.id2) {
                  //     self.$emit("loadCatalogueData");
                  //     this.topId = self.id2;
                  //   }
                  // })
                }, 400)
              }
            });
            let {editor} = this;
            if (editor === 2) {
              this.xs.setDataSettings(false);
            }

            // if (this.sheet && this.sheet.status === true && this.sheet.name != this.$route.path) {
            //   console.log(this.xs);
            //   this.xs.setEditorText(this.sheet.inputText, this.sheet.pos);
            // } else if (this.sheet && this.sheet.status === true && this.sheet.name == this.$route.path) {
            //   console.log(this.sheet)
            //   setTimeout(() => {
            //     this.xs.setTextEnd(this.sheet.inputText, this.sheet.ri, this.sheet.ci);
            //     this.setSheet(null);
            //     this.sh = (!this.sheet || this.sheet.status === false) ? new Sheet(this.$route.path) : "";
            //
            //   }, 500);
            // }
          }
        )
      }
    }
  }
</script>

<style scoped>

</style>

