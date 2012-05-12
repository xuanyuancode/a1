xquery version "1.0";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace xmldb="http://exist-db.org/xquery/xmldb";
declare namespace tf="http://exist-db.org/xquery/transform";

let $userid := request:get-parameter("userid",'')
let $doc:= doc(concat("/db/smartpcc/usermem/",$userid,".mem"))

let $xslt := doc("/db/smartpcc/xsl/memplist.xml")
let $ok  :=  <parameters></parameters>
let $info := tf:transform($doc,$xslt,$ok)

return
$info