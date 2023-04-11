<!---
Name:         all_together_query.cfm
Author:       Cooper Williams
Despcription: Used in census_data_results.cfm to bring forth all entities to help with pagination
Created:      07/19/17
Updated:      07/20/17
--->

<cfquery name = "AllTogether" datasource = "avtgis-eia">

  declare @t varchar(max), @s varchar(max), @n varchar(max);
  set @t = <cfqueryparam value = "#attributes.Type#" CFSQLType = "cf_sql_varchar">;
  set @s =<cfqueryparam value = "#attributes.State#" CFSQLType = "cf_sql_varchar">;
  set @n = <cfqueryparam value = "%#attributes.Nameunit#%" CFSQLType = "cf_sql_varchar">;

  select
      count(*) as ate
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
    ;

</cfquery>
