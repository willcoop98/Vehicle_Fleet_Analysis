<cfquery name = "crawlerDetails" datasource = "avtgis-eia">
  declare @u int, @s int, @t int, @c int;
  set @u = <cfqueryparam value = "#req.Unitcode#" CFSQLType = "cf_sql_int">;
  set @s = <cfqueryparam value = "#req.Statecode#" CFSQLType = "cf_sql_int">;
  set @t = <cfqueryparam value = "#req.Typecode#" CFSQLType = "cf_sql_int">;
  set @c = <cfqueryparam value = "#req.Countycode#" CFSQLType = "cf_sql_int">;

  select
    f.unit_name
    , f.unit_code
    , f.type_code
    , t.type_name
    , f.state_ab
    , f.state_code
    , f.county_code
    , f.web_address
    , f.alt_webaddress
    , f.address1
    , f.zip
    , f.population
    , f.enrollment
    , f.expenditures_2012
  from
    census.frame as f inner join
    census.lu_type as t on f.type_code = t.type_code
  where 0=0
  and (0=1
      or len(@t)=0
      or (len(@t)>0 and f.type_code = @t)
  )
and (0=1
  or len(@u)=0
  or (len(@u) > 0 and f.unit_code = @u)
)
and (0=1
  or len(@s)=0
  or (len(@s) > 0 and f.state_code = @s)
)
and (0=1
  or len(@c)=0
  or (len(@c) > 0 and f.county_code = @c)
)
;
</cfquery>
