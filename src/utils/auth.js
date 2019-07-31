import Cookies from 'js-cookie'

const TokenKey = 'Admin-Token'

export function getToken() {
  return Cookies.get(TokenKey)
}

export function getToken2(TokenKey) {
  let cookie = Cookies.get(TokenKey);
  cookie = typeof cookie === 'string' ? JSON.parse(cookie) : cookie;
  return cookie
}


export function setToken(token) {
  return Cookies.set(TokenKey, token)
}

export function setToken2(TokenKey, token) {
  return Cookies.set(TokenKey, token)
}

export function removeToken() {
  return Cookies.remove(TokenKey)
}

export function removeToken2(TokenKey) {
  return Cookies.remove(TokenKey)
}

export const weixin_url =
  "https://open.weixin.qq.com/connect/qrconnect?appid=wx4df0678ff967e226&redirect_uri=http%3a%2f%2f180.169.75.199:5004/weixincallback&response_type=code&scope=snsapi_login&state=STATE#wechat_redirect";
