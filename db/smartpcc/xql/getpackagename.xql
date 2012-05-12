xquery version "1.0";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace xmldb="http://exist-db.org/xquery/xmldb";
declare namespace tf="http://exist-db.org/xquery/transform";

let $db := xmldb:login("/db/smartpcc", "admin", "")
let $userid := request:get-parameter("userid",'')

let $userdoc := doc(concat("/db/smartpcc/user/",$userid,".xml"))
let $package := $userdoc/user/qq/package/text()
let $good := doc("/db/smartpcc/admin/goods.xml")

return

$good/goods/good[id=$package]/volume/text()
