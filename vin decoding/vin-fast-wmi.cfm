<cfsetting requestTimeOut = "55000"/>

<cfquery name="DoEDVins" datasource="fast">
  select
    v.vehRowID as vrid
    , v.vehID as vid
    , right(v.vehID, 17) as vin
    , v.vehMake as make
    , v.vehModel as model
    , v.vehModelYear as modelYear
    , v.vehGVWR as gvwr

  from
    dbo.usv_QueryBuilder_vldVehicles as v

  where 0 = 0
		and v.agyAbbrev = 'DOED'

  order by v.vehRowID asc
	;
</cfquery>

<cfscript>
  /*for (i = 1; i <= 173; i++) {
    u = 'https://vpic.nhtsa.dot.gov/api/vehicles/getallmanufacturers?format=json&page=#i#';
    cfhttp(url = u, method = 'get', timeout = '55000', resolveurl = 'false', redirect = 'false', result = 'result');
    r = deserializeJSON(result.filecontent);
    for (j = 1; j <= r.Count; j++) {
      vinData = queryExecute("insert into dbo.vldVINManufacturers (jsonResults) values ( :i )"
        , { i : { value : '#serializeJSON(r.Results[j])#', cfsqltype : 'cf_sql_nvarchar' } }
        , { datasource: 'fast' }
        );
    }
  }*/
  for (r in DoEDVins) {
    u='https://vpic.nhtsa.dot.gov/api/vehicles/DecodeVin/#r.vin#?format=json';
    cfhttp(url = u, method = 'get', timeout = '55000', resolveurl = 'false', redirect = 'false', result = 'result');
    r = result.filecontent;
    WriteDump(r);
    if (r != "Connection Failure") {
      r = deserializeJSON(r);

      for (j = 1; j <= r.Count; j++) {
        //if (r.Results[j].VehicleType != 'Trailer' && r.Results[j].VehicleType != 'Motorcycle' && r.Results[j].VehicleType != 'Off Road Vehicle') {
          vinData = queryExecute("insert into dbo.vldVINData (vinData) values ( :i )"
            , { i : { value : '#serializeJSON(r.Results[j])#', cfsqltype : 'cf_sql_nvarchar' } }
            , { datasource: 'fast' }
          );
        //}
      }
    //}
  }

</cfscript>
