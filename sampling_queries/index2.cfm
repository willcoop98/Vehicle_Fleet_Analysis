<!---
Name: the_search1.cfm
Author: Cooper Williams
Description: Intro to forms
Created: 06/28/17
--->
<cfquery name = "units" datasource = "avtgis-eia" result="result">
    select
      uhbuID
      , cfUnitName
    from
      dbo.frameAndHierarchy
    where
      cfUnitName is not null
      and uhuAddress is not null
    Order By
      cfUnitName
</cfquery>
<body>
  <form action="index_set.cfm" method="post">

    <table align="left" border="1">
      <tr>
        <td>
        Census Entity Name:
        </td>
        <td>
        <input type="text" name="cfUnitName">
        </td>
      </tr>
      <tr>
        <td align="center">
          <input type="submit" value="Search">
        </td>
      </tr>
    </table>

    </form>
  <cfoutput>
  <strong>
    Unit List (#result.RecordCount# units)
  </strong>
  </cfoutput>
  <ul>
    <cfoutput query="units">
      <li><a href="index4.cfm?uhbuid=#URLEncodedFormat(Trim(uhbuID))#" target="right">#cfUnitName#</a>
    </cfoutput>
  </ul>
</body>
