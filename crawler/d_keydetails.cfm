<style media="screen">
  .term-highlight{
    background-color: #f0ad4e;
  }
  .phone-highlight {
    background-color: #5cb85c;
  }
  .email-highlight {
    background-color: #5bc0de;
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
  <cfoutput query="primaryFoundTerms">
    <dd>#ctTerm# - #terms_per_unit#</dd>
  </cfoutput>
  <dt>Other Term(s)</dt>
  <cfoutput query="otherFoundTerms">
    <dd><a href="index.cfm?page=KeyDetails&Statecode=#URLEncodedFormat(Trim(state_code))#&Typecode=#URLEncodedFormat(Trim(type_code))#&Countycode=#URLEncodedFormat(Trim(county_code))#&Unitcode=#URLEncodedFormat(Trim(unit_code))#&Crawlterms=#URLEncodedFormat(Trim(ctTerm))#">#ctTerm# - #details_of_select#</a></dd>
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
  <cfoutput query="crawlURLdetails">
        <tr>
          <td>#cuDepth#:</td>
          <td><strong>URL: <a href="#cuAddress#">#Left(cuAddress, 100)#</a></strong><br/>#REReplaceNoCase(REReplaceNoCase(REReplaceNoCase(REReplaceNoCase(urlContent, "\*{3,}", "***", "all"), "\b(" & req.Crawlterms & ")\b", "<span class=""term-highlight"">\1</span>", "all")
              , "(([0-9]{3}[\. \-]){2}[0-9]{4})|(\([0-9]{3}\)[\- ]([0-9]{3}\-)[0-9]{4})", "<span class=""phone-highlight"">\1\3</span>", "all"), "([a-z0-9]+\.[a-z0-9]+\@[a-z]+\.[a-z]+|[a-z0-9]+\@[a-z]+\.[a-z]+)", "<span class=""email-highlight"">\1</span>", "all")#</td>
        </tr>
  </cfoutput>
  </tbody>
</table>
