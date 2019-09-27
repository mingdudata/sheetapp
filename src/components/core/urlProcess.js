function beforeUrlProcess(url) {
  let arr = url.split("?");
  if(arr && arr.length > 1) {
    return arr[0];
  }
  return url;
}

export {
  beforeUrlProcess
}
