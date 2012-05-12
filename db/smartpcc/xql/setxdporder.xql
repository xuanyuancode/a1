xquery version "1.0";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace xmldb="http://exist-db.org/xquery/xmldb";
declare namespace tf="http://exist-db.org/xquery/transform";

let $userid := request:get-parameter("userid",'')
let $name := request:get-parameter("name",'')
let $doc:= doc(concat("/db/smartpcc/user/",$userid,".xml"))
let $do := update replace $doc/user/xdp with <xdp>{$name}</xdp>

return
1