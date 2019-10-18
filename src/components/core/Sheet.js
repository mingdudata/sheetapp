export default class Sheet {
  constructor(name) {
    this.name = name;
    this.ri = 0;
    this.ci = 0;
    this.pos = 0;
    this.inputText = "";
    this.status = false;
    this.alias = "";
  }

  setAlias(alias) {
    this.alias = alias;
  }

  setProp(ri, ci, inputText, status, pos) {
        this.ri = ri;
        this.ci = ci;
        this.inputText = inputText;
        this.status = status;
        this.pos = pos;
  }

  setText(text) {
    // let p1 = this.inputText.substring(0, this.pos);
    // let p2 = this.inputText.substring(this.pos , this.inputText.length);
    this.inputText = text;
  }
}
