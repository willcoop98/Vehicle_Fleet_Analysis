<!---
Name:        census_data_stats.cfm
Author:      Cooper Williams
Description: Data search engine for local govnt census entities
Created:     06/30/17
Updated:     07/20/17
--->

<cfif IsDefined("attributes") EQ false>
  <cfset attributes = structnew()>
  <cfset StructAppend(attributes, form, true)>
  <cfset StructAppend(attributes, url, true)>
</cfif>

<html>

  <head>

    <title>Census Data Results</title>

<!--- Style elements for page--->
    <style media="screen">
      .table1 {
        width: 80%;
        height: auto;
        padding-left: 10px;

      }
      #TableWords {
        align:"center";
      }
    </style>

<!--- javascript for "Go Back" button to return to census_data_results.cfm --->
    <script>
      function goBack() {
        window.history.back();
      }
    </script>

  </head>

  <body>

<!--- SQL query to collect all data within selected census entity--->
    <cfinclude template = "cfquery_census2.cfm">
    <cfinclude template = "cfquery_census02.cfm">

<!--- Call "Go Back" button --->
    <button onclick="goBack()">Go Back</button>

<!--- Results in a specific entity --->
    <div id="TableWords">
      <cfoutput>
        <strong>
          <h1 align="center">Results</h1>
        </strong>
      </cfoutput>



<!--- Key for color-coded results with different uDepth --->
<div class="table1">
        <table border="1" top="0px">
          <cfoutput query="census02">
          <tr>
            <th colspan="2">
              #unit_name#
            </th>
          </tr>
          <tr>
            <th>
              Web address:
            </th>
            <td>
              #alt_webaddress#
            </td>
          </tr>
          <tr>
            <th>
              Address:
            </th>
            <td>
              #address1#
            </td>
          </tr>
          <tr>
            <th>
              Zip:
            </th>
            <td>
              #zip#
            </td>
          </tr>
          <tr>
            <th>
              State:
            </th>
            <td>
              #state_ab#
            </td>
          </tr>
          <tr>
            <th>
              Type:
            </th>
            <td>
              #type_code#
            </td>
          </tr>
          <cfif len(population) >
            <tr>
              <th>Population: </th>
              <td>#population#</td>
            </tr>
          </cfif>
          <cfif len(enrollment) >
            <tr>
              <th>Enrollment: </th>
              <td>#enrollment#</td>
            </tr>
          </cfif>
          <cfif len(expenditures_2012) >
            <tr>
              <th>Expenditures: </th>
              <td>#expenditures_2012#</td>
            </tr>
          </cfif>
            <tr>
              <th>Number of URLs: </th>
              <td>#census2.recordCount#</td>
            </tr>
          </cfoutput>
          <cfif Len(uDepth)>
            <cfoutput query="census2">
              <tr>
                <td align="center">#uDepth#:</td>
                <td><strong>URL: <a href="#uAddress#">#Left(uAddress, 100)#</a></strong><br/>#REReplaceNoCase(urlContent, "\*{3,}", "***", "all")#</td>
              </tr>
            </cfoutput>
          <cfif>
        </table>
</div>




      <!---<cfoutput query="census2">

<!--- Information about census entity --->
        <table align="center" border="1" top="0px">
          <tr>
            <cfif uDepth EQ 0>
              <th colspan="2" bgcolor="red">
                <strong>
                  #unit_name#
                </strong>
              </th>
            <cfelseif uDepth EQ 1>
              <th colspan="2" bgcolor="green">
                <strong>
                  #unit_name#
                </strong>
              </th>
            <cfelseif uDepth EQ 2>
              <th colspan="2" bgcolor="gold">
                <strong>
                  #unit_name#
                </strong>
              </th>
            <cfelse>
              <th colspan="2">
                <strong>
                  #unit_name#
                </strong>
              </th>
            </cfif>
          </tr>
          <tr valign="top">
            <th align="right">
              Web address:
            </th>
            <td>
              #alt_webaddress#
            </td>
          </tr>
        <tr valign="top">
          <th align="right">
            Address:
          </th>
          <td>
            #address1#
          </td>
        </tr>
        <tr valign="top">
          <th align="right">
            Zip:
          </th>
          <td>
            #zip#
          </td>
        </tr>
        <tr valign="top">
          <th align="right">
            State:
          </th>
          <td>
            #state_ab#
          </td>
        </tr>
        <tr valign="top">
          <th align="right">
            Type:
          </th>
          <td>
            #type_code#
          </td>
        </tr>
        <cfif len(population) >
          <tr valign="top">
            <th align="right">Population: </th>
            <td>#population#</td>
          </tr>
        </cfif>
        <cfif len(enrollment) >
          <tr valign="top">
            <th align="right">Enrollment: </th>
            <td>#enrollment#</td>
          </tr>
        </cfif>
        <cfif len(expenditures_2012) >
          <tr valign="top">
            <th align="right">Expenditures: </th>
            <td>#expenditures_2012#</td>
          </tr>
        </cfif>
        <cfif len(uDepth)>
          <tr valign="top">
            <th align="right">Crawl depth: </th>
            <td>#uDepth#</td>
          </tr>
        </cfif>
        <cfif len(urlContent)>
          <tr valign="top">
            <th align="right">URL content: </th>
            <td><div id=CrawlContent><p>#urlContent#</p></div></td>
          </tr>
        </cfif>
      </table>

    </cfoutput>--->

  </body>

</html>
