export function isAuth(tableName, key) {
  let role = localStorage.getItem("UserTableName");
  let menus = [{"backMenu":[{"child":[{"appFrontIcon":"cuIcon-medal","buttons":["新增","查看","修改","删除"],"menu":"用户","menuJump":"列表","tableName":"yonghu"}],"menu":"用户管理"},{"child":[{"appFrontIcon":"cuIcon-skin","buttons":["新增","查看","修改","删除","维护"],"menu":"公交路线","menuJump":"列表","tableName":"gongjiaoluxian"}],"menu":"公交路线管理"},{"child":[{"appFrontIcon":"cuIcon-present","buttons":["新增","查看","修改","删除"],"menu":"公交车信息","menuJump":"列表","tableName":"gongjiaochexinxi"}],"menu":"公交车信息管理"},{"child":[{"appFrontIcon":"cuIcon-newshot","buttons":["新增","查看","修改","删除"],"menu":"站点信息","menuJump":"列表","tableName":"zhandianxinxi"}],"menu":"站点信息管理"},{"child":[{"appFrontIcon":"cuIcon-similar","buttons":["查看","修改","删除"],"menu":"线路维护","menuJump":"列表","tableName":"xianluweihu"}],"menu":"线路维护管理"},{"child":[{"appFrontIcon":"cuIcon-vip","buttons":["查看","修改"],"menu":"系统简介","tableName":"systemintro"},{"appFrontIcon":"cuIcon-time","buttons":["查看","修改"],"menu":"轮播图管理","tableName":"config"},{"appFrontIcon":"cuIcon-news","buttons":["新增","查看","修改","删除"],"menu":"公告信息","tableName":"news"},{"appFrontIcon":"cuIcon-service","buttons":["新增","查看","修改","删除"],"menu":"在线提问","tableName":"chat"},{"appFrontIcon":"cuIcon-album","buttons":["查看","修改"],"menu":"关于我们","tableName":"aboutus"}],"menu":"系统管理"}],"frontMenu":[{"child":[{"appFrontIcon":"cuIcon-medal","buttons":["查看"],"menu":"公交路线列表","menuJump":"列表","tableName":"gongjiaoluxian"}],"menu":"公交路线模块"},{"child":[{"appFrontIcon":"cuIcon-newshot","buttons":["查看"],"menu":"公交车信息列表","menuJump":"列表","tableName":"gongjiaochexinxi"}],"menu":"公交车信息模块"},{"child":[{"appFrontIcon":"cuIcon-camera","buttons":["查看"],"menu":"站点信息列表","menuJump":"列表","tableName":"zhandianxinxi"}],"menu":"站点信息模块"},{"child":[{"appFrontIcon":"cuIcon-taxi","buttons":["查看"],"menu":"线路维护列表","menuJump":"列表","tableName":"xianluweihu"}],"menu":"线路维护模块"}],"hasBackLogin":"是","hasBackRegister":"否","hasFrontLogin":"否","hasFrontRegister":"否","roleName":"管理员","tableName":"users"},{"backMenu":[],"frontMenu":[{"child":[{"appFrontIcon":"cuIcon-medal","buttons":["查看"],"menu":"公交路线列表","menuJump":"列表","tableName":"gongjiaoluxian"}],"menu":"公交路线模块"},{"child":[{"appFrontIcon":"cuIcon-newshot","buttons":["查看"],"menu":"公交车信息列表","menuJump":"列表","tableName":"gongjiaochexinxi"}],"menu":"公交车信息模块"},{"child":[{"appFrontIcon":"cuIcon-camera","buttons":["查看"],"menu":"站点信息列表","menuJump":"列表","tableName":"zhandianxinxi"}],"menu":"站点信息模块"},{"child":[{"appFrontIcon":"cuIcon-taxi","buttons":["查看"],"menu":"线路维护列表","menuJump":"列表","tableName":"xianluweihu"}],"menu":"线路维护模块"}],"hasBackLogin":"否","hasBackRegister":"否","hasFrontLogin":"是","hasFrontRegister":"是","roleName":"用户","tableName":"yonghu"}];
  for(let i=0;i<menus.length;i++){
    if(menus[i].tableName==role){
      for(let j=0;j<menus[i].frontMenu.length;j++){
          for(let k=0;k<menus[i].frontMenu[j].child.length;k++){
            if(tableName==menus[i].frontMenu[j].child[k].tableName){
              let buttons = menus[i].frontMenu[j].child[k].buttons.join(',');
              return buttons.indexOf(key) !== -1 || false
            }
          }
      }
    }
  }
  return false;
}

/**
 *  * 获取当前时间（yyyy-MM-dd hh:mm:ss）
 *   */
export function getCurDateTime() {
    let currentTime = new Date(),
    year = currentTime.getFullYear(),
    month = currentTime.getMonth() + 1 < 10 ? '0' + (currentTime.getMonth() + 1) : currentTime.getMonth() + 1,
    day = currentTime.getDate() < 10 ? '0' + currentTime.getDate() : currentTime.getDate(),
    hour = currentTime.getHours(),
    minute = currentTime.getMinutes(),
    second = currentTime.getSeconds();
    return year + "-" + month + "-" + day + " " +hour +":" +minute+":"+second;
}

/**
 *  * 获取当前日期（yyyy-MM-dd）
 *   */
export function getCurDate() {
    let currentTime = new Date(),
    year = currentTime.getFullYear(),
    month = currentTime.getMonth() + 1 < 10 ? '0' + (currentTime.getMonth() + 1) : currentTime.getMonth() + 1,
    day = currentTime.getDate() < 10 ? '0' + currentTime.getDate() : currentTime.getDate();
    return year + "-" + month + "-" + day;
}
