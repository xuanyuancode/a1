xquery version "1.0";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace xmldb="http://exist-db.org/xquery/xmldb";
declare namespace tf="http://exist-db.org/xquery/transform";
 
let $do  :=  doc("/db/smartpcc/admin/goods.xml")  
let $ok  :=  <parameters></parameters>
let $xslt := doc("http://192.168.1.104/show2.xslt")
return
<ok>
{tf:transform($do,$xslt,$ok)}
</ok>