<cfquery name = "keyDetails" datasource = "avtgis-eia" result="result">

  declare @u int, @s int, @t int, @c int, @term varchar(max);
  set @u = <cfqueryparam value = "#req.Unitcode#" CFSQLType = "cf_sql_int">;
  set @s = <cfqueryparam value = "#req.Statecode#" CFSQLType = "cf_sql_int">;
  set @t = <cfqueryparam value = "#req.Typecode#" CFSQLType = "cf_sql_int">;
  set @c = <cfqueryparam value = "#req.Countycode#" CFSQLType = "cf_sql_int">;
  set @term = <cfqueryparam value = "#req.Crawlterms#" CFSQLType = "cf_sql_varchar">;

  select
    f.unit_name
    , f.type_code
    , t.type_name
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
    , count(c.uID) as nURLs
  from
    census.frame as f inner join
    census.lu_type as t on f.type_code = t.type_code  left join
    dbo.crawl_urlHierarchy as c on f.alt_webaddress = c.cuAddressClean
  where 0=0
    and f.unit_code = @u
    and f.state_code = @s
    and f.type_code = @t
    and f.county_code = @c
  group by
    f.unit_name
    , f.type_code
    , t.type_name
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
    ;

</cfquery>
