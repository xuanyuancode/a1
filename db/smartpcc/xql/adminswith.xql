xquery version "1.0";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace xmldb="http://exist-db.org/xquery/xmldb";
declare namespace tf="http://exist-db.org/xquery/transform";

let $db := xmldb:login("/db/smartpcc", "admin", "")

let $admin:= doc("/db/smartpcc/admin/admin.xml")
let $on := $admin/admin/on/text()

let $do := if(number($on) eq 0) 
then (update replace $admin/admin/on with <on>1</on>) 
else (update replace $admin/admin/on with <on>0</on>) 

return
$admin/admin/on/text()