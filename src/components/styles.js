const bgcolor = {
  sheetStyle1BgColor: '#5CACEE', // 第一行的背景色
  sheetStyle2BgColor: '#EBF3FD' // 第一列的背景色
}

export var styles = [{
  bgcolor: "#f4f5f8",
  textwrap: !0,
  color: "#900b09",
  font: {name: "Arial", size: 10, bold: !0, italic: !1},
  border: {
    top: ["thin", "#0366d6"],
    bottom: ["thin", "#0366d6"],
    right: ["thin", "#0366d6"],
    left: ["thin", "#0366d6"]
  }
}, {
  font: {name: "Arial", size: 10, bold: !0, italic: !1},
  bgcolor: "#5CACEE",
  align: "center"
}, {
  bgcolor: "#EBF3FD",
  border: {top: ["thin", "#fff"], bottom: ["thin", "#fff"], right: ["thin", "#fff"], left: ["thin", "#fff"]},
  align: "left",
  font: {size: 9, bold: !1, italic: !1}
}, {
  align: "left",
  bgcolor: "#F2F2F2",
  border: {top: ["thin", "#fff"], bottom: ["thin", "#fff"], right: ["thin", "#fff"], left: ["thin", "#fff"]},
  font: {size: 9, bold: !1, italic: !1}
}, {
  bgcolor: "#fff",
  align: "left",
  border: {top: ["thin", "#fff"], bottom: ["thin", "#fff"], right: ["thin", "#fff"], left: ["thin", "#fff"]},
  font: {size: 9, bold: !1, italic: !1}
}, {
  bgcolor: "#fff",
  align: "right",
  color: "blue",
  border: {top: ["thin", "#fff"], bottom: ["thin", "#fff"], right: ["thin", "#fff"], left: ["thin", "#fff"]}
}, {
  bgcolor: "#F2F2F2",
  align: "right",
  color: "blue",
  border: {top: ["thin", "#fff"], bottom: ["thin", "#fff"], right: ["thin", "#fff"], left: ["thin", "#fff"]}
}, {
  align: "left",
  format: "percent",
  bgcolor: "#F2F2F2",
  border: {top: ["thin", "#fff"], bottom: ["thin", "#fff"], right: ["thin", "#fff"], left: ["thin", "#fff"]},
  font: {size: 9, bold: !1, italic: !1}
}, {
  bgcolor: "#fff",
  align: "left",
  format: "percent",
  border: {top: ["thin", "#fff"], bottom: ["thin", "#fff"], right: ["thin", "#fff"], left: ["thin", "#fff"]},
  font: {size: 9, bold: !1, italic: !1}
}];

export const defaultOptions = {
  formula: {
    wland() {

    }
  }
};


