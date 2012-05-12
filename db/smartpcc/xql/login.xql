xquery version "1.0";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace xmldb="http://exist-db.org/xquery/xmldb";
declare namespace tf="http://exist-db.org/xquery/transform";

let $doc:= request:get-data()
let $xslt := doc("/db/smartpcc/xsl/login.xml")
let $ok  :=  <parameters></parameters>
let $info := tf:transform($doc,$xslt,$ok)
let $user := $info/user/text()
let $pw := $info/pw/text()

let $userdoc := doc(concat("/db/smartpcc/user/",$user,".xml"))
let $userpw := string(doc(concat("/db/smartpcc/user/",$user,".xml"))/user/@pw)

let $do := if($pw = $userpw) then (update replace $userdoc/user/qq/online with <online>1</online>) else $ok
 
return
if($pw = $userpw)
then
1
else
0