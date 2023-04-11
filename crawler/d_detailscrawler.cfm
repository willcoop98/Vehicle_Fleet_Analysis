<h2>Crawl</h2>
<cfoutput query="crawlerDetails">
  <dl class="dl-horizontal">
    <dt>Name</dt>
    <dd>#unit_name#</dd>
    <cfif len(alt_webaddress)>
      <dt>Web Address</dt>
      <dd>#alt_webaddress#</dd>
    </cfif>
    <cfif Len(address1)>
      <dt>Address</dt>
      <dd>#address1#</dd>
    </cfif>
    <dt>Zip</dt>
    <dd>#zip#</dd>
    <dt>State</dt>
    <dd>#state_ab#</dd>
    <dt>Type</dt>
    <dd>#type_name#</dd>
    <cfif Len(population)>
      <dt>Population</dt>
      <dd>#NumberFormat(population)#</dd>
    </cfif>
    <cfif Len(enrollment)>
      <dt>Enrollment</dt>
      <dd>#NumberFormat(enrollment)#</dd>
    </cfif>
    <cfif Len(expenditures_2012)>
      <dt>Expenditures</dt>
      <dd>$#NumberFormat(expenditures_2012)#</dd>
    </cfif>
    <dt>Status Code</dt>
    <dd>#result.status_code#</dd>
    <dt>Status Text</dt>
    <dd>#result.status_text#</dd>
    <cfif ListFindNoCase("300,301,302,303,304,305,306,307,308", result.status_code)>
      <dt>Location</dt>
      <dd><a href="#result.responseheader.Location#" target="right">#result.responseheader.Location#</a></dd>
    <cfelseif ListFindNoCase("200,201,202,203,204,205,206,207,208,226", result.status_code)>
      <dt>Content</dt>
      <dd><iframe src="#web_address#" height="700px" width="100%">#result.filecontent#</iframe> </dd>
    </cfif>
  </dl>
</cfoutput>
<!---<cfdump var="#crawlerDetails#">--->
