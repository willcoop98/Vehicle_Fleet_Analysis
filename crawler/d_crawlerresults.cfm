<h2>Results</h2>
<table id="results" class="table" cellspacing="0" width="100%">
  <thead>
    <cfoutput query="CrawlAllbutton">
    <tr>
      <th>State</th>
      <th>Name</th>
      <th>URL</th>
      <th><a href="index.cfm?page=CrawlAll&CodeType=#URLEncodedFormat(type_name)#" class="btn btn-default">Crawl All</a></th>
    </tr>
    <input type="hidden" name="page" value="CrawlAll">
  </cfoutput>
  </thead>
  <tbody>
    <cfoutput query="censuscrawlResults">
    <tr>
      <td>#state_ab#</td>
      <td>#unit_name#</td>
      <td><a href="#web_address#">#web_address#</a></td>
      <td><a href="index.cfm?page=DetailsCrawler&Statecode=#URLEncodedFormat(Trim(state_code))#
          &Typecode=#URLEncodedFormat(Trim(type_code))#
          &Countycode=#URLEncodedFormat(Trim(county_code))#
          &Unitcode=#URLEncodedFormat(Trim(unit_code))#" class="btn btn-default">Crawl</a></td>
    </tr>
    <input type="hidden" name="page" value="CrawlerDetails">
    </cfoutput>
  </tbody>
</table>
<!---<cfdump var="#censuscrawlResults#">--->
