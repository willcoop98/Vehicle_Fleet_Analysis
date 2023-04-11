<!---
Name:         state_query.cfm
Author:       Cooper Williams
Despcription: Used in census_data_site.cfm to help specify state
Created:      07/18/17
Updated:      01/20/17
--->

<cfquery name = "census3" datasource = "avtgis-eia">

    select distinct
      state_ab
    from
      census.frame
    order by
      state_ab

</cfquery>
