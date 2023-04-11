<!---<cfdump var = "#r#">
<cfdump var = "#searchResults#" top="10">--->
<style media="screen">
  td.number {
    text-align: right;
  }
</style>
<h2>Results</h2>
<table id="results" class="table" cellspacing="0" width="100%">
  <thead>
    <tr>
      <th>Type</th>
      <th>State</th>
      <th>Name</th>
      <th>Size</th>
    </tr>
  </thead>
  <tfoot>
    <tr>
      <th>Type</th>
      <th>State</th>
      <th>Name</th>
      <th>Size</th>
    </tr>
  </tfoot>
  <tbody>
    <cfoutput query="searchResults">
      <tr>
        <td>#type_name#</td>
        <td>#state_ab#</td>
        <td><a href="index.cfm?page=EntityDetails&Statecode=#URLEncodedFormat(Trim(state_code))#&Typecode=#URLEncodedFormat(Trim(type_code))#&Countycode=#URLEncodedFormat(Trim(county_code))#&Unitcode=#URLEncodedFormat(Trim(unit_code))#">#unit_name#</a></td>
        <cfif len(population)>
          <td class="number">#NumberFormat(population)#</td>
        <cfelseif len(enrollment)>
          <td class="number">#NumberFormat(enrollment)#</td>
        <cfelse>
          <td></td>
        </cfif>
      </tr>
    </cfoutput>
  </tbody>
</table>
