<cfquery name = "CrawlAllbutton" datasource = "avtgis-eia" maxrows="5">

  declare @t varchar(max);
  set @t = <cfqueryparam value = "#req.Type#" CFSQLType = "cf_sql_varchar">;

  select distinct
      t.type_name
  from
     census.frame as f inner join
     census.lu_type as t on f.type_code = t.type_code
  where
    t.type_name = @t
  ;

</cfquery>
