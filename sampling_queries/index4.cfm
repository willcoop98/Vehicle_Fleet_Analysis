<cfif not IsDefined("URL.uhbuID")>
  <cflocation url = "index3.cfm">
</cfif>

<cfquery name = "units" datasource = "avtgis-eia" result="result">
    select
      uhbuID
      , cfUnitName
      , cfPopulation
      , cfTypeName
      , cfStateName
      , cfaddress1
      , uhpuAddress
    from
      dbo.frameAndHierarchy
    where
      uhbuID=#URL.uhbuID#
</cfquery>

<cfif result.RecordCount is 0>
  <cflocation url = "index3.cfm">
</cfif>

<body>
  <cfoutput query="units">

  <table>
    <tr>
      <td colspan="2">
        <strong>#cfUnitName#</strong>
      </td>
    </tr>
    <tr valign="top">
      <th align="right">Type: </th>
      <td>#cfTypeName#</td>
    </tr>
    <tr valign="top">
      <th align="right">Address: </th>
      <td>#cfaddress1#</td>
    </tr>
    <tr valign="top">
      <th align="right">State: </th>
      <td>#cfStateName#</td>
    </tr>
    <tr valign="top">
      <th align="right">Population: </th>
      <td>#cfPopulation#</td>
    </tr>
    <tr valign="top">
      <th align="right">Web Address: </th>
      <td>#uhpuAddress#</td>
    </tr>
  </table>
  </cfoutput>
</body>
