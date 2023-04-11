<cfquery name = "units" datasource = "avtgis-eia">
    select
      *
    from
      dbo.frameAndHierarchy
    where
      UnitName like '%#Form.cfUnitName#%'
    order by
      cfUnitName
</cfquery>

<html>
  <head>
    <title>blip bloop blop</title>
  </head>
  <body>
    <table>
      <tr>
        <th colspan="2">
          <cfoutput>
            <font size="+3">Census Entities (#units.RecordCount# units)</font>
          </cfoutput>
        </th>
      </tr>
      <cfoutput query="units">
        <tr>
          <td>
            <font size="+2">#CurrentRow#: <a href="results2.cfm?unit_name=#URLEncodedFormat(Trim(unit_name))#"><strong>#unit_name#</strong></a></font><br>
          </td>
        </tr>
      </cfoutput>
    </table>
  </body>
</html>
