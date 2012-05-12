xquery version "1.0";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace xmldb="http://exist-db.org/xquery/xmldb";
declare namespace tf="http://exist-db.org/xquery/transform";

let $db := xmldb:login("/db/smartpcc", "admin", "")
let $userid := request:get-parameter("userid",'')
let $volume := request:get-parameter("volume",'')
let $mode := request:get-parameter("mode",'')

let $userdoc := doc(concat("/db/smartpcc/user/",$userid,".xml"))

let $oldvolume := $userdoc/user/qq/*[name()=$mode]/text()

let $topvolume := number($userdoc/user/qq/topV/text())

let $newvolue := number($oldvolume) +number($volume)


let $newvolue := if ($mode eq "chargeV" and $newvolue gt $topvolume)
then $topvolume
else $newvolue

let $do := (update replace $userdoc/user/qq/*[name()=$mode]/text() with $newvolue)

return
$newvolue