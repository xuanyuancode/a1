xquery version "1.0";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace xmldb="http://exist-db.org/xquery/xmldb";
declare namespace tf="http://exist-db.org/xquery/transform";

let $userid := request:get-parameter("userid",'')
let $parental := request:get-parameter("parental",'')
let $doc:= doc(concat("/db/smartpcc/user/",$parental,".xml"))

let $xslt := doc("/db/smartpcc/xsl/getlimit.xml")
let $ok  :=  <parameters></parameters>
let $item := tf:transform($doc/user/pc/items/item[tel=$userid],$xslt,$ok)

return
$item