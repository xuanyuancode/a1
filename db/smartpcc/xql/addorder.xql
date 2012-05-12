xquery version "1.0";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace xmldb="http://exist-db.org/xquery/xmldb";
declare namespace tf="http://exist-db.org/xquery/transform";

let $db := xmldb:login("/db/smartpcc", "admin", "")
let $orderid := request:get-parameter("orderid",'')
let $userid := request:get-parameter("userid",'')
let $orderitem:= doc("/db/smartpcc/admin/goods.xml")
let $userdoc := doc(concat("/db/smartpcc/user/",$userid,".xml"))
let $volume := $orderitem/goods/good[id=$orderid]/volume/text()
let $oldvolume := $userdoc/user/qq/topV/text()

let $do := if(number($orderid) le 1003) then (update replace $userdoc/user/qq/topV with <topV>{$volume}</topV>) else  (update replace $userdoc/user/qq/topV with <topV>{$volume + $oldvolume}</topV>)

let $do := if(number($orderid) le 1003) then (update replace $userdoc/user/qq/package with <package>{$orderid}</package>) else $oldvolume 

let $do := if(number($orderid) le 1003) then (update replace $userdoc/user/qq/chargeV with <chargeV>0</chargeV>) else $oldvolume 

let $do := if(number($orderid) le 1003) then (update replace $userdoc/user/qq/nopackageV with <nopackageV>0</nopackageV>) else $oldvolume 


return
1