xquery version "1.0";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace xmldb="http://exist-db.org/xquery/xmldb";
declare namespace tf="http://exist-db.org/xquery/transform";

let $user := request:get-parameter("user",'')
let $doc:= doc(concat("/db/smartpcc/user/",$user,".xml"))
let $xslt := doc("/db/smartpcc/xsl/qqdata.xml")
let $ok  :=  <parameters></parameters>
let $info := tf:transform($doc/user/qq,$xslt,$ok)

return
$info
