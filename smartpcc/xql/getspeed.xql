xquery version "1.0";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace xmldb="http://exist-db.org/xquery/xmldb";
declare namespace tf="http://exist-db.org/xquery/transform";
declare namespace f="http://www.my.com";

declare function f:topspeed($path as xs:string)
{
let $doc := xmldb:xcollection($path)
let $sum :=
sum(
for $user in $doc/user
let $number := number($user/qq/speed/text()) 
where $user/qq/online/text() eq "1"
return  
number($user/qq/speed/text()))
return $sum
};

let $db := xmldb:login("/db/smartpcc", "admin", "")
let $userid := request:get-parameter("userid",'')
let $mode := request:get-parameter("mode",'')

let $admin:= doc("/db/smartpcc/admin/admin.xml")
let $userdoc := doc(concat("/db/smartpcc/user/",$userid,".xml"))

let $package := $userdoc/user/qq/ package/text()
let $on := $admin/admin/on/text() 

let $speed := $admin/admin/speedset/*[name()=$mode]/text() 

let $topspeed := f:topspeed("/db/smartpcc/user")

let $freespeed := 4096 - number($topspeed) + number($userdoc/user/qq/speed/text())

let $slow := $admin/admin/speedset/lowdown/text()

let $red := $admin/admin/red/text()

let $nowspeed := if(number($topspeed) gt 4096 * number($red) div 100 and number($on) eq 1)
then if ((number($freespeed) gt number($speed)) and (number($package) != 1003))
then number($speed)*number($slow)
else $freespeed


else $speed


let $do := (update replace $userdoc/user/qq/speed with <speed>{$nowspeed}</speed>)

return
$nowspeed
