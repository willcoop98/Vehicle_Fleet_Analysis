<h2>Crawler</h2>
<cfoutput>
  <form class="form-horizontal" action="index.cfm" method="post">
    <div class="form-group">
      <label for="inputType" class="col-sm-2 control-label">Type: </label>
      <div class="col-sm-10">
        <select class="form-control" name="Type">
          <cfloop query = "unitType">
            <option value="#type_name#" <cfif ListFindNoCase(req.Type, "#type_name#")>selected</cfif>> #type_name# <br>
          </cfloop>
        </select>
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
        <input type="submit" name="submit" class="btn btn-default" onclick="return validateForm(this.form)">
      </div>
    </div>

    <input type="hidden" name="page" value="ResultsCrawler" >
    <cfif StructKeyExists(req, "dump")>
      <input type="hidden" name="dump" value="#req.dump#">
    </cfif>
  </form>
</cfoutput>
