<cfquery name = "thebaseofdata" datasource = "avtgis-eia">
select 
  c.unit_name
  , c.state_code
  , c.type_code
  , c.county_code
  , c.unit_code
  , c.state_ab
  , t.type_name
from
  census.frame as c
  inner join census.lu_type as t on c.type_code = t.type_code
where
  c.unit_name like <cfqueryparam value = "%#attributes.Nameunit#%" CFSQLType = "cf_sql_varchar">
  and t.type_name = <cfqueryparam value = "#attributes.Type#" CFSQLType = "cf_sql_varchar">
  and c.state_ab = <cfqueryparam value = "#attributes.State#" CFSQLType = "cf_sql_varchar">
order by
  c.unit_name
    ;
</cfquery>
