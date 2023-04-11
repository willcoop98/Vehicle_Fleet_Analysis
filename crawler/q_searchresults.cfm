<cfquery name="searchResults" datasource="avtgis-eia" result="r">

  declare @t varchar(max), @n varchar(max), @s varchar(max);
  set @t = <cfqueryparam value = "#req.Type#" CFSQLType = "cf_sql_varchar">;
  set @n = <cfqueryparam value = "%#req.Unitname#%" CFSQLType = "cf_sql_varchar">;
  set @s = <cfqueryparam value = "#req.State#" CFSQLType = "cf_sql_varchar">;

  select
    c.unit_name
    , c.state_code
    , c.type_code
    , c.county_code
    , c.unit_code
    , c.state_ab
    , c.enrollment
    , c.population
    , t.type_name
  from
    census.frame as c
    inner join census.lu_type as t on c.type_code = t.type_code
  where 0=0
    and (@t != 'SPECIAL DISTRICT'
      and (0=1
          or len(@t)=0
          or (len(@t)>0 and t.type_name in (select value from dbo.fn_split(@t, ',')))
      )
    )
    and (0=1
      or len(@n)=0
      or (len(@n) > 0 and c.unit_name like '%' + @n + '%')
    )
    and ( 0=1
      or len(@s)=0
      or (len(@s) > 0 and c.state_ab in (select value from dbo.fn_split(@s, ',')))
    )
  ;

</cfquery>
