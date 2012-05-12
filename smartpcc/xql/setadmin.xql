xquery version "1.0";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace xmldb="http://exist-db.org/xquery/xmldb";
declare namespace tf="http://exist-db.org/xquery/transform";

let $doc:= request:get-data()
let $admin:= doc("/db/smartpcc/admin/admin.xml")

let $xslt := doc("/db/smartpcc/xsl/login.xml")
let $ok  :=  <parameters></parameters>
let $items := tf:transform($doc,$xslt,$ok)
let $do := update replace $admin/admin/vip with $items/vip
let $do := update replace $admin/admin/novip with $items/novip
let $do := update replace $admin/admin/red with $items/red
return
1