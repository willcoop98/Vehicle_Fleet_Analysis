  <cfoutput>
    <h2>Census Search</h2>
    <form class="form-horizontal" action="index.cfm" method="post">
      <div class="form-group">
        <label for="inputUnit" class="col-sm-2 control-label">Unit Name: </label>
        <div class="col-sm-10">
          <input type="text" class="form-control" name="UnitName" value="#req.UnitName#" placeholder="Name">
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
        <label for="inputType" class="col-sm-2 control-label">State: </label>
        <div class="col-sm-10">
              <select multiple class="form-control" name="State">
                <cfloop query = "unitState">
                  <option value="#state_ab#" <cfif ListFindNoCase(req.State, "#state_ab#")>selected</cfif>> #state_ab# <br/>
                </cfloop>
              </select>
        </div>
      </div>

      <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
          <input type="submit" name="submit" class="btn btn-default" onclick="return validateForm(this.form)">
        </div>
      </div>

      <input type="hidden" name="page" value="SearchResults" >
      <cfif StructKeyExists(req, "dump")>
        <input type="hidden" name="dump" value="#req.dump#">
      </cfif>
    </form>
  </cfoutput>
