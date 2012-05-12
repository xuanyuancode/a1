xquery version "1.0";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace xmldb="http://exist-db.org/xquery/xmldb";
declare namespace tf="http://exist-db.org/xquery/transform";

let $userid := request:get-parameter("userid",'')
let $doc:= doc(concat("/db/smartpcc/user/",$userid,".xml"))
let $on := $doc/user/fz/text()

let $do := if(number($on) eq 1) 
then update replace $doc/user/fz/text() with  0
else update replace $doc/user/fz/text() with  1
return
1