<cfset s = createObject("component","server")>
<cfset s.onserverstart()>
<cfdump var="#server#" label="server scope" expand="true" />
