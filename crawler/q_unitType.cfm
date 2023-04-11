<cfquery name = "unitType" datasource = "avtgis-eia">

    select distinct
      type_name
    from
      census.lu_type
    where
      type_name != 'SPECIAL DISTRICT'

</cfquery>
