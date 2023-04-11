<cfif IsDefined("attributes") EQ false>
  <cfset attributes = structnew()>
  <cfset StructAppend(attributes, form, true)>
  <cfset StructAppend(attributes, url, true)>
</cfif>
<cfparam name="attributes.Type" default="">
<cfparam name="attributes.State" default="">
<cfparam name="attributes.Nameunit" default="">
<html>
  <head>
    <title>Census Table</title>
  </head>
  <body>
    <cfinclude template = "census_data_site.cfm">
    <cfinclude template = "census_table001.cfm">
    <table border="1">
      <tr>
        <th>Name</th>
        <th>Type</th>
        <th>State</th>
      </tr>
      <cfoutput query="thebaseofdata">
        <tr>
          <td><a href="census_link.cfm?StateCode=#URLEncodedFormat(Trim(state_code))#&TypeCode=#URLEncodedFormat(Trim(type_code))#&CountyCode=#URLEncodedFormat(Trim(county_code))#&UnitCode=#URLEncodedFormat(Trim(unit_code))#" target="right">#unit_name#</a></td>
          <td>#state_ab#</td>
          <td>#type_name#</td>
        </tr>
      </cfoutput>
    </table>
