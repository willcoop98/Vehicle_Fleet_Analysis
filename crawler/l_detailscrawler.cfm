<cfhttp url="#crawlerDetails.web_address#"
  method="get"
  timeout="10"
  proxyserver="webbalance.inl.gov"
  proxyport="8080"
  resolveurl="false"
  redirect="false"
  result="result"
  />
<!---<cfdump var="#result#">--->
