<cfquery name = "Crawlall" datasource = "avtgis-eia" maxrows="5">
  declare @t varchar(max);
  set @t = <cfqueryparam value = "#req.CodeType#" CFSQLType = "cf_sql_varchar">;

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
    census.lu_type as t on f.type_code = t.type_code full join
    dbo.crawl_urls as c on f.web_address = c.cuBaseAddress
  where 0=0
      and t.type_name = @t
      and f.web_address is not null
      and c.cuID is null
      and f.web_address != ' '
      and f.web_address != '  '
  order by
    f.state_ab
  ;

</cfquery>
