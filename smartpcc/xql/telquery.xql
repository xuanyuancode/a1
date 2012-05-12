xquery version "1.0";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace xmldb="http://exist-db.org/xquery/xmldb";
declare namespace tf="http://exist-db.org/xquery/transform";
declare namespace f="http://www.my.com";

let $db := xmldb:login("/db/smartpcc", "admin", "")

let $userid := request:get-parameter("userid",'')
let $city := request:get-parameter("city",'')
let $mem:= doc(concat("/db/smartpcc/usermem/",$userid,".mem"))

let $items := $mem/mem/item/city[text()=$city]/..

let $info :=
for $item in $items
return  
concat(",",$item/lname/text())

return 
$info



