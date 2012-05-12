xquery version "1.0";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace xmldb="http://exist-db.org/xquery/xmldb";
declare namespace tf="http://exist-db.org/xquery/transform";

let $db := xmldb:login("/db/smartpcc", "admin", "") 

let $doc := request:get-data()
let $userid := request:get-parameter("userid",'')

let $xslt := doc("/db/smartpcc/xsl/memdata.xml")
let $ok  :=  <parameters></parameters>
let $info := tf:transform($doc,$xslt,$ok)

let $do := xmldb:store("/db/smartpcc/usermem", concat($userid,".mem"), $info)
return
1