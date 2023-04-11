<style media="screen">
  .term-highlight{
    background-color: yellow;
  }
</style>
<h2>Entity Details</h2>
<dl class="dl-horizontal">
  <cfoutput query="EntityDetails">
    <dt>Name</dt>
    <dd>#unit_name#</dd>
    <cfif len(alt_webaddress)>
      <dt>Web Address</dt>
      <dd>#alt_webaddress#</dd>
    </cfif>
    <dt>Address</dt>
    <dd>#address1#</dd>
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
    <dt>Number of URLs</dt>
    <dd>#nURLS#</dd>
  </cfoutput>
  <dt>Primary Term</dt>
  <cfoutput query="otherprimaryDetails">
    <dd>#ctTerm# - #terms_per_unit#</dd>
  </cfoutput>
  <dt>Other Term(s)</dt>
  <cfoutput query="otherkeytermDetails">
    <dd><a href="index.cfm?page=OtherKeyDetails&Statecode=#URLEncodedFormat(Trim(state_code))#&Typecode=#URLEncodedFormat(Trim(type_code))#&Countycode=#URLEncodedFormat(Trim(county_code))#&Unitcode=#URLEncodedFormat(Trim(unit_code))#&Othercrawlterms=#URLEncodedFormat(Trim(ctTerm))#">#ctTerm# - #details_of_select#</a></dd>
  </cfoutput>
</dl>
  <table  id="keydetails" class="table" cellspacing="0" width="100%">
    <thead>
      <tr>
        <th>Depth</th>
        <th>Information and Details</th>
      </tr>
    </thead>
    <tbody>
    <cfoutput query="URLokd">
          <tr>
            <td>#cuDepth#:</td>
            <td><strong>URL: <a href="#cuAddress#">#Left(cuAddress, 100)#</a></strong><br/>#REReplaceNoCase(urlContent, "\*{3,}", "***", "all")#<br/>#ReplaceNoCase(urlContent, ctTerm, '<font style="background-color:yellow;">ctTerm</font>', "all")#</td>
          </tr>
    </cfoutput>
    </tbody>
  </table>
