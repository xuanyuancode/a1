xquery version "1.0";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace xmldb="http://exist-db.org/xquery/xmldb";
declare namespace tf="http://exist-db.org/xquery/transform";
declare namespace f="http://www.my.com";

let $db := xmldb:login("/db/smartpcc", "admin", "")
let $doc := xmldb:xcollection("/db/smartpcc/user")
let $admin:= doc("/db/smartpcc/admin/admin.xml")
let $on := $admin/admin/on/text()

let $top :=
sum(
for $user in $doc/user
let $number := number($user/qq/speed/text()) 
where $user/qq/online/text() eq "1"
return  
number($user/qq/speed/text()))

let $topvip :=
sum(
for $user in $doc/user
let $number := number($user/qq/speed/text()) 
where ($user/qq/online/text() eq "1") and ($user/qq/package/text() eq "1003")
return  
number($user/qq/speed/text()))

let $topnovip :=
sum(
for $user in $doc/user
let $number := number($user/qq/speed/text()) 
where ($user/qq/online/text() eq "1") and ($user/qq/package/text() ne "1003")
return  
number($user/qq/speed/text()))

let $countuser :=
count(
for $user in $doc/user
return  
$user)

let $countnovip :=
count(
for $user in $doc/user
where $user/qq/package/text() ne "1003"
return  
$user)

let $countvip :=
count(
for $user in $doc/user
where $user/qq/package/text() eq "1003"
return  
$user)

let $systeminfo := concat($top,",",$topvip,",",$topnovip,",",$countuser,",",$countvip,",",$countnovip,",",$on)

return 
$systeminfo