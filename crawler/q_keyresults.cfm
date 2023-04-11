<cfquery name = "keyResults" datasource = "avtgis-eia">
  declare @term varchar(max), @t varchar(max);
  set @term = <cfqueryparam value = "#req.Crawlterms#" CFSQLType = "cf_sql_varchar">;
  set @t = <cfqueryparam value = "#req.Type#" CFSQLType = "cf_sql_varchar">;

  select
    f.unit_name
    , f.unit_code
    , f.type_code
    , l.type_name
    , f.state_ab
    , f.state_code
    , f.county_code
    , c.ctTerm
    , count(t.ctID) as terms_per_unit
  from
    census.frame as f inner join
    census.lu_type as l on f.type_code = l.type_code inner join
    dbo.crawl_urls as u on f.web_address = u.cuBaseAddress inner join
    dbo.crawl_foundTerms as t on u.cuID = t.cuID inner join
    dbo.crawl_terms as c on t.ctID = c.ctID
  where 0=0
    and u.cuIgnore = 0
    and (0=1
        or len(@term)=0
        or (len(@term)>0 and c.ctTerm in (select value from dbo.fn_split(@term, ',')))
    )
    and (0=1
        or len(@t)=0
        or (len(@t)>0 and l.type_name in (select value from dbo.fn_split(@t, ',')))
    )
  group by
  f.unit_name
  , f.unit_code
  , f.type_code
  , l.type_name
  , f.state_ab
  , f.state_code
  , f.county_code
  , c.ctTerm
order by
  terms_per_unit desc
;
</cfquery>
