xquery version "1.0";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace xmldb="http://exist-db.org/xquery/xmldb";
declare namespace tf="http://exist-db.org/xquery/transform";
declare namespace f="http://www.my.com";

let $db := xmldb:login("/db/smartpcc", "admin", "")
let $doc := xmldb:xcollection("/db/smartpcc/user")

let $sum :=
sum(
for $user in $doc/user
let $number := number($user/qq/speed/text()) 
where $user/qq/online/text() eq "1"
return  
number($user/qq/speed/text()))

return $sum

