xquery version "1.0";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace xmldb="http://exist-db.org/xquery/xmldb";
declare namespace tf="http://exist-db.org/xquery/transform";
declare namespace f="http://www.my.com";

let $db := xmldb:login("/db/smartpcc", "admin", "")

let $userid := request:get-parameter("userid",'')
let $mem:= doc(concat("/db/smartpcc/usermem/",$userid,".mem"))

let $citys := $mem/mem/item/city

let $info :=
for $city in $citys
return  
concat(",",$city/text())


return 
$info