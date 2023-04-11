<cfquery name = "units" datasource = "avtgis-eia" result="result">
    select
      uhbuID
      , cfUnitName
    from
      dbo.frameAndHierarchy
    where
      cfUnitName is not null
      and uhuAddress is not null
      and cfUnitName like '%#FORM.cfUnitName#%'
    Order By
      cfUnitName
</cfquery>
