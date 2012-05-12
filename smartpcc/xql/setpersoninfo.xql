xquery version "1.0";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace xmldb="http://exist-db.org/xquery/xmldb";
declare namespace tf="http://exist-db.org/xquery/transform";

let $db := xmldb:login("/db/smartpcc", "admin", "")

let $userid := request:get-parameter("userid",'')
let $doc:= request:get-data()
let $userdoc:= doc(concat("/db/smartpcc/user/",$userid,".xml"))

let $xslt := doc("/db/smartpcc/xsl/setpersoninfo.xml")
let $ok  :=  <parameters></parameters>
let $items := tf:transform($doc,$xslt,$ok)
let $do := update replace $userdoc/user/userinfo with $items
return
1