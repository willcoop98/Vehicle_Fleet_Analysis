<cfquery name = "crawlTerms" datasource = "avtgis-eia" >
  select distinct
    ctTerm
  from
    dbo.crawl_terms
  ;
</cfquery>
