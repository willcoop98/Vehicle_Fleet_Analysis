<cfquery name = "webAddress" datasource = "avtgis-eia" maxrows="10">
  declare @t varchar(max);
  set @t = <cfqueryparam value = "#req.CodeType#" CFSQLType = "cf_sql_varchar">;

  select
    f.web_address
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
