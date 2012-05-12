xquery version "1.0";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace xmldb="http://exist-db.org/xquery/xmldb";
declare namespace tf="http://exist-db.org/xquery/transform";
declare namespace f="http://www.my.com";

let $db := xmldb:login("/db/smartpcc", "admin", "")

let $userid := request:get-parameter("userid",'')
let $userdoc := doc(concat("/db/smartpcc/user/",$userid,".xml"))


let $do := (update replace $userdoc/user/qq/online with <online>1</online>)

return
1