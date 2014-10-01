for $v in doc("property.xml")/Property/Block [@Type = 'uni']
if ($v/Res/Vacancy/)
then (let $r := $v/Res/Vacancy/Renter
let $o := data($v/Owner/)
let $p := $v/Res) 
else ()

for $rent in doc("renter.xml")/Renter/Tenant
if (data($r/@Id) eq data($rent/@Id))
then (let $renter := $rent/Name) else ()

for $own in doc("owner.xml")/Owner/Indiv
if (data($o/@Id) eq data($own/@Id))
then (let $owner := $own/Name) else ()

return
<Results>
	<Property ID>{$p/@Id}</Property ID>
	<Owner>{$owner}</Owner>
	<Renter>{$renter}</Renter>
</Results>