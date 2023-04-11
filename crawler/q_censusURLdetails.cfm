<cfquery name = "censusURLdetails" datasource = "avtgis-eia" result="result">

    declare @u int, @s int, @t int, @c int;
    set @u = <cfqueryparam value = "#req.Unitcode#" CFSQLType = "cf_sql_int">;
    set @s = <cfqueryparam value = "#req.Statecode#" CFSQLType = "cf_sql_int">;
    set @t = <cfqueryparam value = "#req.Typecode#" CFSQLType = "cf_sql_int">;
    set @c = <cfqueryparam value = "#req.Countycode#" CFSQLType = "cf_sql_int">;

    select
      c.uAddress
      , c.urlContent
      , c.uDepth
    from
      census.frame as f left join
      dbo.crawl_urlHierarchy as c on f.alt_webaddress = c.cuAddressClean
    where 0=0
      and f.unit_code = @u
      and f.state_code = @s
      and f.type_code = @t
      and f.county_code = @c
    ;

</cfquery>
