xquery version "1.0";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace xmldb="http://exist-db.org/xquery/xmldb";
declare namespace tf="http://exist-db.org/xquery/transform";

let $doc:= doc("/db/smartpcc/admin/xdaypass.xml")
let $xslt := doc("/db/smartpcc/xsl/xdaypass.xml")
let $ok  :=  <parameters></parameters>
let $info := tf:transform($doc,$xslt,$ok)

return
$info