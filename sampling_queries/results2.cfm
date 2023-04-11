<!DOCTYPE html>
<html>
  <head>
    <title>rubsio</title>
  </head>
  <cfquery name = "unit" datasource = "avtgis-eia">
      select
        *
      from
        dbo.frameAndHierarchy
      where
        uhbuID = #uhbuID#
  </cfquery>
  <body>
    <cfoutput query="unit">
      <table>
        <tr>
          <td colspan="2">
            <strong>#UnitName#</strong>
          </td>
        </tr>
        <tr valign="top">
          <th align="right">Unit code: </th>
          <td>#cfUnitCode#</td>
        </tr>
        <tr valign="top">
          <th align="right">State: </th>
          <td>#cfStateName#</td>
        </tr>
        <tr valign="top">
          <th align="right">State code: </th>
          <td>#cfStateCode#</td>
        </tr>
        <tr valign="top">
          <th align="right">Type: </th>
          <td>#cfTypeName#</td>
        </tr>
        <tr valign="top">
          <th align="right">Address: </th>
          <td>#cfaddress1#</td>
        </tr>
      </table>
    </cfoutput>
  </body>
</html>
