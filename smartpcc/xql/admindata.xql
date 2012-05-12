xquery version "1.0";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace xmldb="http://exist-db.org/xquery/xmldb";
declare namespace tf="http://exist-db.org/xquery/transform";

let $doc:= doc("/db/smartpcc/admin/admin.xml")

let $xslt := doc("/db/smartpcc/xsl/admindata.xml")
let $ok  :=  <parameters></parameters>
let $item := tf:transform($doc,$xslt,$ok)

return
$item