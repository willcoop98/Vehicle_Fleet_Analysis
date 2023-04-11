<cfquery name = "unitState" datasource = "avtgis-eia">

    select distinct
      state_ab
    from
      census.frame
    order by
      state_ab

</cfquery>
