<!---
Name:        census_data_result.cfm
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
<cfparam name="attributes.Type" default="">
<cfparam name="attributes.State" default="">
<cfparam name="attributes.Nameunit" default="">
<cfparam name="attrinutes.Start" default="1">
<cfparam name="attributes.pageNum" default="1">

<!--- HTML page for data --->
<html>

  <head>

    <title>Census Data Results</title>
<!--- Style elememts for page --->
    <style media="screen">
      .results {
        padding-top: 190px;
        padding-bottom: 10px;
        height: 1000px;
        width: 50%;
        padding-left: 300px;
      }
      .pagination {
        width: 80%;
        height: 100px;
        padding-left: 100px;
        padding-bottom: 100px;
        OVERFLOW-Y:scroll;
      }
      .buttons {
        width: 80%;
        height: auto;
        padding-bottom: 10px;
        padding-left: 550px;
      }
    </style>

  </head>

  <body>
<!--- SQL Query that brings forth all entities --->
    <cfinclude template = "all_together_query.cfm">

<!--- How many rows will be on page at a time? --->
      <cfset maxRows = 50>

<!--- Set variable to bring forth all entities --->
      <cfset Total = AllTogether.ate>

<!--- What entities and pages will start? --->
      <cfset Start = min( ( attributes.pageNum-1 ) * maxRows+1, max( Total,1 ) )>

<!--- What entities and pages will end? --->
      <cfset End = min( Start + maxRows-1, Total )>

<!--- Next button --->
      <cfif End GTE Total>
        <cfset End = Total>
        <cfset Next = false>
      <cfelse>
        <cfset Next = true>
          <cfif End + maxRows GT Total>
            <cfset NextNum = Total - End>
          <cfelse>
            <cfset NextNum = maxRows>
          </cfif>
        <cfset NextStart = End + 1>
      </cfif>

<!--- Previous button --->
      <cfif Start IS 1>
        <cfset Previous = false>
      <cfelse>
        <cfset Previous = true>
        <cfset PreviousStart = Start - maxRows>
      </cfif>

<!--- Total # of pages --->
      <cfset totalPages = ceiling( Total/maxRows )>

<!--- SQL Query to bring forth specified entites --->
    <cfinclude template = "cfquery_census.cfm">

<!--- Link to census_data_site.cfm to keep search box  --->
    <cfinclude template = "census_data_site.cfm">

    <div class="results">

<!--- Output entities --->
      <cfoutput>
        <font size="+3"><strong>Entities</strong>: #Start# - #End# (of #Total#)</font>
      </cfoutput>

      <ul>
        <cfoutput query="census">
          <li><a href="census_data_stats.cfm?StateCode=#URLEncodedFormat(Trim(state_code))#&TypeCode=#URLEncodedFormat(Trim(type_code))#&CountyCode=#URLEncodedFormat(Trim(county_code))#&UnitCode=#URLEncodedFormat(Trim(unit_code))#">#unit_name#, #state_ab#</a></li>
        </cfoutput>
      </ul>

    </div>

<!--- Pagination --->
    <div class="buttons">

<!--- Previous button --->
      <cfif Previous>
        <cfoutput>
          <a href="census_data_results.cfm?Start=#PreviousStart#&pageNum=#DecrementValue(attributes.pageNum)#&Nameunit=#URLEncodedFormat(Trim(attributes.Nameunit))#&Type=#URLEncodedFormat(Trim(attributes.Type))#&State=#URLEncodedFormat(Trim(attributes.State))#">&lt;&lt;&nbsp;Previous</a>
        </cfoutput>
      <cfelse>
        &nbsp;
      </cfif>

<!--- Next button --->
      <cfif Next>
        <cfoutput>
          <a href="census_data_results.cfm?Start=#NextStart#&pageNum=#IncrementValue(attributes.pageNum)#&Nameunit=#URLEncodedFormat(Trim(attributes.Nameunit))#&Type=#URLEncodedFormat(Trim(attributes.Type))#&State=#URLEncodedFormat(Trim(attributes.State))#">Next&nbsp;&gt;&gt;</a>
        </cfoutput>
      <cfelse>
        &nbsp;
      </cfif>

    </div>

    <div class="pagination">

<!--- All pages in pagination --->
      <cfoutput>
        <cfloop from="1" to="#totalPages#" index="i">
          <a href="census_data_results.cfm?pageNum=#i#&Nameunit=#URLEncodedFormat(Trim(attributes.Nameunit))#&Type=#URLEncodedFormat(Trim(attributes.Type))#&State=#URLEncodedFormat(Trim(attributes.State))#">#i#</a>
        </cfloop>
      </cfoutput>

    </div>

    <cfoutput>
      <font size="+1">Page #attributes.pageNum# (of #totalPages#)</font>
    </cfoutput>

  </body>

</html>
