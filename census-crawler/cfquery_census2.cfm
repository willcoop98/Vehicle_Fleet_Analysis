<!---
Name:         cfquery_census2.cfm
Author:       Cooper Williams
Despcription: used in census_data_stats.cfm to bring forth all the results in specified entity
Created:      07/17/17
Updated:      07/20/17
--->

<cfquery name = "census2" datasource = "avtgis-eia" result="result">

select 
      f.unit_name
      , f.type_code
      , f.county_code
      , f.unit_code
      , f.address1
      , f.state_ab
      , f.state_code
      , f.zip
      , f.population
      , f.enrollment
      , f.expenditures_2012
      , f.title
      , f.city
      , f.web_address
      , f.alt_webaddress
      , c.uID
      , c.uAddress
      , c.urlContent
      , c.uDepth
    from
      census.frame as f left join
      dbo.crawl_urlHierarchy as c on f.alt_webaddress = c.cuAddressClean
    where
      f.unit_code = <cfqueryparam value = "#attributes.UnitCode#" CFSQLType = "cf_sql_int">
      and f.state_code = <cfqueryparam value = "#attributes.StateCode#" CFSQLType = "cf_sql_int">
      and f.type_code = <cfqueryparam value = "#attributes.TypeCode#" CFSQLType = "cf_sql_int">
      and f.county_code = <cfqueryparam value = "#attributes.CountyCode#" CFSQLType = "cf_sql_int">
    ;

</cfquery>
