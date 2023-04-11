<cfquery name = "census2" datasource = "avtgis-eia" result="result">

select top 1000
      f.unit_name
      , f.type_code
      , f.county_code
      , f.unit_code
      , f.address1
      , f.state_ab
      , f.state_code
      , f.zip
      , f.population
      , f.enrollment
      , f.expenditures_2012
      , f.title
      , f.city
      , f.web_address
      , f.alt_webaddress
      , c.uID
      , c.uAddress
      , c.urlContent
      , c.uDepth
    from
      census.frame as f left join
      dbo.crawl_urlHierarchy as c on f.alt_webaddress = c.cuAddressClean
    ;

</cfquery>
