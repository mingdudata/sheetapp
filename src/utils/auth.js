const TokenKey = 'Admin-Token'

export function getToken() {
  return localStorage.getItem(TokenKey);
}

export function getToken2(TokenKey) {
  console.log(JSON.parse(localStorage.getItem(TokenKey)))
  return JSON.parse(localStorage.getItem(TokenKey));
}

export function setToken(token) {
  return localStorage.setItem(TokenKey, token);
}

export function setToken2(TokenKey, token) {
  return localStorage.setItem(TokenKey, JSON.stringify(token));
}

export function removeToken() {
  return localStorage.removeItem(TokenKey);
}

export function removeToken2(TokenKey) {
  return localStorage.removeItem(TokenKey);
}

export const weixin_url =
  "https://open.weixin.qq.com/connect/qrconnect?appid=wx4df0678ff967e226&redirect_uri=http%3a%2f%2f192.168.31.9:8080/weixincallback&response_type=code&scope=snsapi_login&state=STATE#wechat_redirect";
