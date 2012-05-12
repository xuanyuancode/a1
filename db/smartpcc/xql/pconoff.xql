xquery version "1.0";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace xmldb="http://exist-db.org/xquery/xmldb";
declare namespace tf="http://exist-db.org/xquery/transform";

let $userid := request:get-parameter("userid",'')
let $doc:= doc(concat("/db/smartpcc/user/",$userid,".xml"))
let $on := $doc/user/pc/@on
let $pcoff := <pc on="0"><parental></parental><items><item><game>0</game><shop>0</shop><sn>0</sn><tel></tel></item><item><game>0</game><shop>0</shop><sn>0</sn><tel></tel></item></items></pc>
let $pcon := <pc on="1"><parental></parental><items><item><game>0</game><shop>0</shop><sn>0</sn><tel></tel></item><item><game>0</game><shop>0</shop><sn>0</sn><tel></tel></item></items></pc>

let $do := if(number($on) eq 1) 
then update replace $doc/user/pc with  $pcoff
else update replace $doc/user/pc with  $pcon
return
1