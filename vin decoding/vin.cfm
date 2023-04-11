<cfscript>
	// Instantiate our VIN helper:
	vdc = createObject("component", "vindecoder");
</cfscript>

<cfquery name="qryVehicles" datasource="vmis_peacecorps">
	select top 50
		v.vid
		, vp.pcid
		, v.vin
		, m.makeLabel as make
		, lm.modelLabel as model
		, vt.modelYear

	from
		dbo.vehicle as v inner join
		dbo.vehicle_pcs as vp on v.vid = vp.vid inner join
		dbo.vehicle_type as vt on v.vtid = vt.vtid inner join
		dbo.lu_model as lm on vt.modelid = lm.modelid inner join
		dbo.lu_make as m on lm.makeid = m.makeid

	where 0 = 0
		and isnull(v.disposaldate, getdate() + 1) > '2016-09-30'

	order by
		v.vid asc
	;
</cfquery>

<html>
	<head>
		<title>VIN Checking / Decoding</title>
	</head>
	<body>
		<cfscript>
			writeOutput('<code>');
			for (r in qryVehicles) {
				d = vdc.decode(r.vin, r.modelYear);
					writeOutput('#r.vid#,#r.pcid#,#r.make#,#r.model#,#r.modelYear#,#r.vin#,' & numberFormat(d.check, '000') & '[' & vdc.calculateCheckDigit(r.vin) & '|' & d.checkDigit & '],r: ' & d.region &
											',c: ' & d.country & ',mfr: ' & d.manufacturer & ',y: ' & d.modelYear & ',vpic:' & serializeJSON(d.vpic) & '<br />');
			}
			writeOutput('<code>');
		</cfscript>
	</body>
</html>
