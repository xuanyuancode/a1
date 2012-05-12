xquery version "1.0";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace xmldb="http://exist-db.org/xquery/xmldb";
declare namespace tf="http://exist-db.org/xquery/transform";
declare namespace f="http://www.my.com";

let $db := xmldb:login("/db/smartpcc", "admin", "")

let $userid := request:get-parameter("userid",'')
let $user:= doc(concat("/db/smartpcc/user/",$userid,".xml"))

let $admin:= doc("/db/smartpcc/admin/admin.xml")

let $userinfo := concat($user/user/userinfo/location/text(),",",$user/user/userinfo/access/text(),",",$user/user/qq/online/text(),",",$user/user/userinfo/name/text(),",",$user/user/userinfo/gender/text(),",",$user/user/userinfo/age/text(),",",$admin/admin/garde/text(),",",$user/user/userinfo/devsz/text(),",",$user/user/userinfo/devtype/text())

return $userinfo