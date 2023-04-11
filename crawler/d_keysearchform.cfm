<cfoutput>
  <h2>Crawl Term Search</h2>
  <form class="form-horizontal" action="index.cfm" method="post">
    <div class="form-group">
      <label for="inputType" class="col-sm-2 control-label">Terms: </label>
      <div class="col-sm-10">
            <select class="form-control" name="CrawlTerms">
              <cfloop query = "crawlTerms">
                <option value="#ctTerm#" <cfif ListFindNoCase(req.Crawlterms, "#ctTerm#")>selected</cfif>> #ctTerm# <br/>
              </cfloop>
            </select>
      </div>
    </div>
    <div class="form-group">
      <label for="inputType" class="col-sm-2 control-label">Type: </label>
      <div class="col-sm-10">
        <div class="checkbox">
          <cfloop query = "unitType">
            <label>
              <input type="checkbox" name="Type" value="#type_name#" <cfif ListFindNoCase(req.Type, "#type_name#")>checked</cfif>> #type_name# <br/>
            </label>
          </cfloop>
        </div>
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
        <input type="submit" name="submit" class="btn btn-default" onclick="return validateForm(this.form)">
      </div>
    </div>

    <input type="hidden" name="page" value="KeyResults" >
    <cfif StructKeyExists(req, "dump")>
      <input type="hidden" name="dump" value="#req.dump#">
    </cfif>
  </form>
</cfoutput>
