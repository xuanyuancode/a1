xquery version "1.0";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace xmldb="http://exist-db.org/xquery/xmldb";
declare namespace tf="http://exist-db.org/xquery/transform";

let $userid := request:get-parameter("userid",'')
let $like := request:get-parameter("like",'')
let $doc:= doc(concat("/db/smartpcc/user/",$userid,".xml"))
let $db := xmldb:login("/db/smartpcc", "admin", "")

let $do := update insert <like>{$like}</like> into $doc/user/likes

return
1
