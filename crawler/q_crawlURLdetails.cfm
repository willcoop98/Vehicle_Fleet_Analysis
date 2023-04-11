<cfquery name = "crawlURLdetails" datasource = "avtgis-eia" result="result">

    declare @u int, @s int, @t int, @c int, @term varchar(max);
    set @u = <cfqueryparam value = "#req.Unitcode#" CFSQLType = "cf_sql_int">;
    set @s = <cfqueryparam value = "#req.Statecode#" CFSQLType = "cf_sql_int">;
    set @t = <cfqueryparam value = "#req.Typecode#" CFSQLType = "cf_sql_int">;
    set @c = <cfqueryparam value = "#req.Countycode#" CFSQLType = "cf_sql_int">;
    set @term = <cfqueryparam value = "#req.Crawlterms#" CFSQLType = "cf_sql_varchar">;

    select distinct
      u.cuAddress
      , u.urlContent
      , u.cuDepth
      , c.ctTerm
    from
    census.frame as f inner join
    dbo.crawl_urls as u on f.web_address = u.cuBaseAddress inner join
    dbo.crawl_foundTerms as t on u.cuID = t.cuID inner join
    dbo.crawl_terms as c on t.ctID = c.ctID
    where 0=0
    and u.cuIgnore = 0
    and f.unit_code = @u
    and f.state_code = @s
    and f.type_code = @t
    and f.county_code = @c
    and c.ctTerm = @term
    ;

</cfquery>
