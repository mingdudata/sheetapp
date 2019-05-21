const bgcolor = {
  sheetStyle1BgColor: '#5CACEE', // 第一行的背景色
  sheetStyle2BgColor: '#EBF3FD' // 第一列的背景色
}

export const styles = [ // 一共有6个 style
  { // 暂时没有用到
    bgcolor: '#f4f5f8',
    textwrap: true,
    color: '#900b09',
    font: {name: 'Arial', size: 10, bold: true, italic: false},
    border: {
      top: ['thin', '#0366d6'],
      bottom: ['thin', '#0366d6'],
      right: ['thin', '#0366d6'],
      left: ['thin', '#0366d6']
    }
  },
  { // 第一行日期style     1
    font: {name: 'Arial', size: 10, bold: true, italic: false},
    bgcolor: bgcolor.sheetStyle1BgColor,
    align: 'center'
  },
  { // 第一列的颜色         2
    bgcolor: bgcolor.sheetStyle2BgColor,
    border: {
      top: ['thin', '#fff'],
      bottom: ['thin', '#fff'],
      right: ['thin', '#fff'],
      left: ['thin', '#fff']
    }
  },
  { //      3
    align: 'center',
    bgcolor: '#F2F2F2',
    border: {
      top: ['thin', '#fff'],
      bottom: ['thin', '#fff'],
      right: ['thin', '#fff'],
      left: ['thin', '#fff']
    }
  },
  { // 4
    bgcolor: '#fff',
    // color: 'blue',
    border: {
      top: ['thin', '#fff'],
      bottom: ['thin', '#fff'],
      right: ['thin', '#fff'],
      left: ['thin', '#fff']
    }
  },
  { // 5
    bgcolor: '#fff',
    align: 'right',
    color: 'blue',
    border: {
      top: ['thin', '#fff'],
      bottom: ['thin', '#fff'],
      right: ['thin', '#fff'],
      left: ['thin', '#fff']
    }
  },
  { // 6
    bgcolor: '#F2F2F2',
    align: 'right',
    color: 'blue',
    border: {
      top: ['thin', '#fff'],
      bottom: ['thin', '#fff'],
      right: ['thin', '#fff'],
      left: ['thin', '#fff']
    }
  }
]

export const defaultOptions = {
  showToolbar: true,
  showGrid: true,
  showContextmenu: true,
  view: {
    height: () => document.documentElement.clientHeight,
    width: () => document.documentElement.clientWidth,
  },
  row: {
    len: 100,
    height: 25,
  },
  rowWidth: {         // 第一列的width为180
    state: false,
    width: 240
  },
  col: {
    len: 26,
    width: 100,
    indexWidth: 60,
    minWidth: 60,
  },
  style: {
    bgcolor: '#ffffff',
    align: 'left',
    valign: 'middle',
    textwrap: false,
    strike: false,
    underline: false,
    color: '#0a0a0a',
    font: {
      name: 'Helvetica',
      size: 10,
      bold: false,
      italic: false,
    },
  },
}
