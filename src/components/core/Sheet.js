export default class Sheet {
  constructor(name) {
    this.name = name;
    this.ri = 0;
    this.ci = 0;
    this.inputText = "";
    this.status = false;
    this.alias = "";
  }

  setAlias(alias) {
    this.alias = alias;
  }

  setProp(ri, ci, inputText, status) {
        this.ri = ri;
        this.ci = ci;
        this.inputText = inputText;
        this.status = status;
  }

  setText(text) {
    this.inputText = text;
  }
}
