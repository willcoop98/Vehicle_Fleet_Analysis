<h2>Results</h2>
  <table id="keyresults" class="table" cellspacing="0" width="100%">
    <thead>
      <tr>
        <th>Type</th>
        <th>State</th>
        <th>Name</th>
        <th>Number of terms found</th>

      </tr>
    </thead>
    <tbody>
      <cfoutput query="keyResults">
      <tr>
        <td>#type_name#</td>
        <td>#state_ab#</td>
        <td><a href="index.cfm?page=KeyDetails&Statecode=#URLEncodedFormat(Trim(state_code))#&Typecode=#URLEncodedFormat(Trim(type_code))#&Countycode=#URLEncodedFormat(Trim(county_code))#&Unitcode=#URLEncodedFormat(Trim(unit_code))#&Crawlterms=#URLEncodedFormat(Trim(ctTerm))#">#unit_name#</a></td>
        <td>#terms_per_unit#</td>
      </tr>
      </cfoutput>
    </tbody>
  </table>
