<!---
Name:         type_query.cfm
Author:       Cooper Williams
Despcription: Used in census_data_site.cfm to help specify type
Created:      07/18/17
Updated:      07/20/17
--->

<cfquery name = "census4" datasource = "avtgis-eia">

    select distinct
      type_name
    from
      census.lu_type

</cfquery>
