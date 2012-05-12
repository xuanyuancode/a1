xquery version "1.0";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace xmldb="http://exist-db.org/xquery/xmldb";
declare namespace tf="http://exist-db.org/xquery/transform";

let $userid := request:get-parameter("userid",'')
let $data := request:get-parameter("data",'')
let $doc:= doc(concat("/db/smartpcc/user/",$userid,".xml"))
let $xslt := doc(concat("/db/smartpcc/xsl/",$data,"plist.xml"))
let $ok  :=  <parameters></parameters>
let $info := tf:transform($doc,$xslt,$ok)

return
$info
