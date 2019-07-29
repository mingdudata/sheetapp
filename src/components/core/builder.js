import {getToken2} from "../../utils/auth";
/*
  动态构造dir
 */
const dirBuilder = ({path, parent, alias, type, icon, id, sheet, sheet_id}) => {
  let user = typeof getToken2("user") === 'string' ? JSON.parse(getToken2("user")) : getToken2("user");
  if (!user)
    return;

  let entity = {
    "alias": alias,
    "path": path,
    "parent": parent,
    "childs": null,
    "icon": icon,
    "id": id,
    "sheet": sheet,
    "sheet_id": sheet_id,
    "type": type,
    "user_id": user.id
  };
  return entity;
};

export {
  dirBuilder
}
