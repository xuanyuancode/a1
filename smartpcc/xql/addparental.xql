xquery version "1.0";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace xmldb="http://exist-db.org/xquery/xmldb";
declare namespace tf="http://exist-db.org/xquery/transform";

let $userid := request:get-parameter("userid",'')
let $id := request:get-parameter("id",'')
let $db := xmldb:login("/db/smartpcc", "admin", "") 
let $userdoc:= doc(concat("/db/smartpcc/user/",$id,".xml"))

let $do := update replace $userdoc/user/pc/parental with <parental>{$userid}</parental>
return
1