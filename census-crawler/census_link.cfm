<cfif IsDefined("attributes") EQ false>
  <cfset attributes = structnew()>
  <cfset StructAppend(attributes, form, true)>
  <cfset StructAppend(attributes, url, true)>
</cfif>
<cfparam name="attributes.Type" default="">
<cfparam name="attributes.State" default="">
<cfparam name="attributes.Nameunit" default="">
<html>
  <head>
    <title>Census Data Results</title>
  </head>
  <body>
    <cfinclude template = "query_census_table_results.cfm">
      <cfinclude template = "cfquery_census02.cfm">
      <ul>
        <cfoutput query="census2">
          <li>Name: #unit_name#</li>
          <li>Web address: #alt_webaddress#</li>
          <li>Address: #address1#</li>
          <li>Zip: #zip#</li>
          <li>State: #state_ab#</li>
          <li>Type: #type_code#</li>
          <li>Number of URLS: #census02.recordCount#</li>
        </cfoutput>
      </ul>
          <cfoutput query="census02">
            <cfif len(uAddress)>
            <table border="1">
              <tr>
                <td align="center">#uDepth#:</td>
                <td><strong>URL: <a href="uAddress">#Left(uAddress, 100)#</a></strong><br/>#REReplaceNoCase(urlContent, "\*{3,}", "***", "all")#</td>
              </tr>
            </table>
            <cfelse>
              <table border="1">
                <tr>
                  <td align="center"></td>
                </tr>
              </table>
            </cfif>
          </cfoutput>
  </body>
</html>
