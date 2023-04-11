<style media="screen">
  .phone-highlight {
    background-color: #5cb85c;
  }
  .email-highlight {
    background-color: #5bc0de;
  }
</style>

  <h2>Entity Details</h2>
  <cfoutput query="EntityDetails">
    <dl class="dl-horizontal">
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
    </dl>
  </cfoutput>
  <table  id="details" class="display" cellspacing="0" width="100%">
    <thead>
      <tr>
        <th>Depth</th>
        <th>Information and Details</th>
      </tr>
    </thead>
    <tbody>
    <cfoutput query="censusURLdetails">
      <cfif Len(uDepth)>
          <tr>
            <td>#uDepth#:</td>
            <td><strong>URL: <a href="#uAddress#">#Left(uAddress, 100)#</a></strong><br/>#REReplaceNoCase(REReplaceNoCase(REReplaceNoCase(urlContent, "\*{3,}", "***", "all"), "(([0-9]{3}[\. \-]){2}[0-9]{4})|(\([0-9]{3}\)[\- ]([0-9]{3}\-)[0-9]{4})", "<span class=""phone-highlight"">\1\3</span>", "all"), "([a-z0-9]+\.[a-z0-9]+\@[a-z]+\.[a-z]+|[a-z0-9]+\@[a-z]+\.[a-z]+)", "<span class=""email-highlight"">\1</span>", "all")#</td>
          </tr>
      </cfif>
    </cfoutput>
    </tbody>
  </table>
