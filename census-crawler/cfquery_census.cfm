<!---
Name:         cfquery_census.cfm
Author:       Cooper Williams
Despcription: Used for pagination and to help specify certain entities,
              used in census_data_site.cfm & census_data_results.cfm
Created:      07/17/17
Updated:      07/20/17
--->

<cfquery name="census" datasource="avtgis-eia" result="r">

  declare @t varchar(max), @s varchar(max), @n varchar(max), @sn int, @fn int;
  set @t = <cfqueryparam value = "#attributes.Type#" CFSQLType = "cf_sql_varchar">;
  set @s =<cfqueryparam value = "#attributes.State#" CFSQLType = "cf_sql_varchar">;
  set @n = <cfqueryparam value = "%#attributes.Nameunit#%" CFSQLType = "cf_sql_varchar">;
  set @sn = <cfqueryparam value = "#Start#" CFSQLType = "cf_sql_int">;
  set @fn = <cfqueryparam value = "#End#" CFSQLType = "cf_sql_int">;

    select
      *
    from
      (select
          ROW_NUMBER() OVER ( ORDER BY c.unit_name ) AS RowNum
          , c.unit_name
          , c.state_code
          , c.type_code
          , c.county_code
          , c.unit_code
          , c.state_ab
          , t.type_name
      from
          census.frame as c
          inner join census.lu_type as t on c.type_code = t.type_code
      where 0=0
          and (0=1
              or len(@n)=0
              or (len(@n) > 0 and c.unit_name like '%' + @n + '%')
              )
          and (0=1
              or len(@t)=0
              or (len(@t)>0 and t.type_name in (select value from dbo.fn_split(@t, ',')))
              )
          and (0=1
              or len(@s)=0
              or (len(@s)>0 and c.state_ab in (select value from dbo.fn_split(@s, ',')))
              )
        ) as pg
    where 0=0
      and (RowNum >= @sn
      and RowNum <= @fn)
    ;

  </cfquery>
