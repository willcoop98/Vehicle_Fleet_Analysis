<!---
Name:        census_data_site.cfm
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
<html>

  <head>

    <title>Census Data Search</title>

<!--- Javascript used to enable the "check all" in State portion of checkbox --->
    <script type="text/javascript">
      function toggle(source) {
          checkboxes = document.getElementsByName('State');
        for(var i=0, n=checkboxes.length;i<n;i++) {
          checkboxes[i].checked = source.checked;
        }
      };
    </script>

<!--- Style elements for page --->
    <style media="screen">
      .search {
        padding-top: 20px;
        position:absolute;
        left:0;
        right:0;
        height: 92px;
      }
      #State_box {
        OVERFLOW-Y:scroll;
        WIDTH:100px;
        HEIGHT:90px
      }
      #Type_box {
        OVERFLOW-Y:scroll;
        WIDTH:160px;
        HEIGHT:90px
      }
    </style>

<!--- Call forward query for state abbreviations --->
    <cfinclude template = "state_query.cfm">

<!--- Call forward query for type names --->
    <cfinclude template = "type_query.cfm">

  </head>

  <body>

    <!--- Search form based on census entity unit name --->
  <div class="search">
    <form action="data_census_table.cfm" method="post">

      <table align="center" border="1">

        <tr>
          <td>
            Entity Name:
          </td>
          <td colspan="3">
            <cfoutput>
              <input type="text" name="Nameunit" value="#attributes.Nameunit#">
            </cfoutput>
          </td>
        </tr>
        <tr>
          <td align="center">
            State:
          </td>
          <td>
            <div id="State_box">
              <input type="checkbox" name="State" onclick="toggle(this)" value="submit" <cfif ListFindNoCase(attributes.State, "submit")>checked</cfif>>Check All<br>
              <cfloop query = "census3">
                <cfoutput>
                  <input type="checkbox" name="State" value="#state_ab#" <cfif ListFindNoCase(attributes.State, "#state_ab#")>checked</cfif>>#state_ab#<br/>
                </cfoutput>
              </cfloop>
            </div>
          </td>
          <td>
            Type:
          </td>
          <td>
            <div id="Type_box">
              <cfloop query = "census4">
                <cfoutput>
                  <input type="checkbox" name="Type" value="#type_name#" <cfif ListFindNoCase(attributes.Type, "#type_name#")>checked</cfif>>#type_name#<br/>
                </cfoutput>
              </cfloop>
          </td>
        </tr>
        <tr>
          <td colspan="4" align="center">
            <input name="Submit" type="submit" value="Search" onclick="return validateForm(this.form)">
          </td>
        </tr>

      </table>

    </form>
  </div>

  </body>

</html>
