xquery version "1.0";
declare namespace request="http://exist-db.org/xquery/request";
declare namespace xmldb="http://exist-db.org/xquery/xmldb";
declare namespace tf="http://exist-db.org/xquery/transform";

let $doc := <plist><array><dict><key>limit</key><string>a</string><key>tel</key><string>a</string><key>name</key><string>a</string></dict></array><array><dict><key>limit</key><string>a</string><key>tel</key><string>a</string><key>name</key><string>a</string></dict></array></plist>

let $xslt := doc("/db/smartpcc/xsl/updataqs.xml")
let $ok  :=  <parameters></parameters>
let $items := tf:transform($doc,$xslt,$ok)

return
$items