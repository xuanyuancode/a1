xquery version "1.0";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace xmldb="http://exist-db.org/xquery/xmldb";
declare namespace tf="http://exist-db.org/xquery/transform";

let $userid := request:get-parameter("userid",'')
let $xdaydoc:= doc("/db/smartpcc/admin/xdaypass.xml")
let $doc:= doc(concat("/db/smartpcc/user/",$userid,".xml"))
let $price := $doc/user/xdp/text()
let $name := $xdaydoc/goods/good/price[text()=$price]/../name/text()
return
$name


