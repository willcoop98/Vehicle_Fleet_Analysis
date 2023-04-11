<cfsetting requestTimeOut = "3600000"/>

<cfscript>
	// Instantiate our VIN helper:
	vdc = createObject("component", "vindecoder");
</cfscript>

<cfquery name="qryVehicles" datasource="fast">
select
	v.vehRowID as vrid
	, v.vehID as vid
	, right(v.vehID, 17) as vin
	, v.vehMake as make
	, v.vehModel as model
	, v.vehModelYear as modelYear
	, v.vehGVWR as gvwr
	, v.vehOwnershipType as own

from
	dbo.usv_QueryBuilder_vldVehicles as v

where 0 = 0
	and len(v.vehID) >= 17
	and v.vehRowID > 1641380

order by v.vehRowID asc
;
</cfquery>

<html>
	<head>
		<title>VIN Checking / Decoding</title>
	</head>
	<body>
		<cfscript>
			AOcounter = 0;
			CDLcounter = 0;
			CWLcounter = 0;
			GDLcounter = 0;
			GWLcounter = 0;
			writeOutput('<code>');
			for (r in qryVehicles) {
				d = vdc.decode(r.vin, r.modelYear);
				/*wmiQuery = queryExecute("select json_value(w.jsonResult, '$.Name') as [name], json_value(w.jsonResult, '$.WMI') as wmi, json_value(w.jsonResult, '$.Country') as country, json_value(w.jsonResult, '$.VehicleType') as type
																from dbo.vldWMI_Information_json as w
																where json_value(w.jsonResult, '$.WMI') = :wim
																order by json_value(w.jsonResult, '$.Name'), json_value(w.jsonResult, '$.WMI');",
																{wim=d.wmi}, { datasource: 'fast' } );*/
				/*if (vdc.calculateCheckDigit(r.vin) != d.checkDigit) {
					switch(r.own) {
						case 'Agency-owned':
							AOcounter++;
							break;
						case 'Commercial Dry Lease':
							CDLcounter++;
							break;
						case 'Commercial Wet Lease':
							CWLcounter++;
							break;
						case 'GSA Dry Lease':
							GDLcounter++;
							break;
						case 'GSA Wet Lease':
							GWLcounter++;
							break;
						default:
							break;
					}*/
					writeOutput('#r.vrid#,#r.make#,#r.model#,#r.modelYear#,#r.vin#,#r.gvwr#,' & numberFormat(d.check, '000') & '[' & vdc.calculateCheckDigit(r.vin) & '|' & d.checkDigit & '],r: ' & d.region &
											',c: ' & d.country & ',mfr: ' & d.manufacturer & ',y: ' & d.modelYear & ',vpic info: ' & serializeJSON(d.vpic) & '<br />');

					vinData = queryExecute("insert into dbo.vldVehicleVINData (vrID, decodedVINData) values ( :i, :j )"
						, { i : { value : '#r.vrID#', cfsqltype : 'cf_sql_integer'} , j : { value : '#serializeJSON(d.vpic)#', cfsqltype : 'cf_sql_nvarchar'} }
						, { datasource : 'fast' }
					);


				//else {
					//WriteOutput('BAD VIN!!! ' & '#r.vrid#,#r.make#,#r.model#,#r.modelYear#,#r.vin#,#r.gvwr#,' & numberFormat(d.check, '000') & '[' & vdc.calculateCheckDigit(r.vin) & '|' & d.checkDigit & '],r: ' & d.region &
						//					',c: ' & d.country & ',mfr: ' & d.manufacturer & ',y: ' & d.modelYear & ',wmi info: '& wmiQuery.name & ',' & wmiQuery.country & ',' & wmiQuery.type &  '<br />');

			}
			//WriteOutput('Agency-owned: ' & AOcounter & '<br />' & 'Commercial Dry Lease: ' & CDLcounter & '<br />' & 'Commercial Wet Lease: ' & CWLcounter & '<br />' & 'GSA Dry Lease: ' & GDLcounter & '<br />' & 'GSA Wet Lease: ' & GWLcounter);
			writeOutput('<code>');
		</cfscript>
	</body>
</html>
