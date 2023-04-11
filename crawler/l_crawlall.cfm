<cfset Crawl= []>

<cfloop query="Crawlall">
  <cfhttp url="#web_address#"
    method="get"
    timeout="10"
    proxyserver="webbalance.inl.gov"
    proxyport="8080"
    resolveurl="false"
    redirect="false"
    result="h"
    />
  <cfset ArrayAppend(Crawl, h)>
</cfloop>
