<cfquery name = "censuscrawlResults" datasource = "avtgis-eia" maxrows="5">

  declare @t varchar(max);
  set @t = <cfqueryparam value = "#req.Type#" CFSQLType = "cf_sql_varchar">;

    select
      f.unit_name
      , f.unit_code
      , f.type_code
      , f.state_ab
      , f.state_code
      , f.county_code
      , f.web_address
    from
      census.frame as f inner join
      census.lu_type as t on f.type_code = t.type_code full join
      dbo.crawl_urls as c on f.web_address = c.cuBaseAddress
    where 0=0
      and f.web_address is not null
      and f.web_address != ' '
      and f.web_address != '  '
      and c.cuID is null
      and t.type_name = @t
    order by
      f.state_ab
      ;

</cfquery>
