xquery version "1.0";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace xmldb="http://exist-db.org/xquery/xmldb";
declare namespace tf="http://exist-db.org/xquery/transform";

let $db := xmldb:login("/db/smartpcc", "admin", "")
let $doc := xmldb:xcollection("/db/smartpcc/user")
let $xslt := doc("/db/smartpcc/xsl/adminuserlist.xml")
let $ok  :=  <parameters></parameters>
let $info := tf:transform(<xml>{$doc}</xml>,$xslt,$ok)
return
$info