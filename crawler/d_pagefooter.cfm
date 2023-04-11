    </div><!-- /.container -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery-1.12.4.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>

    <!-- Data Tables -->
    <cfif ListFindNoCase("SearchResults,EntityDetails,KeyResults,KeyDetails,ResultsCrawler", req.page)>
      <script type="text/javascript" src="DataTables-1.10.15/js/jquery.dataTables.min.js"></script>
      <script type="text/javascript" src="DataTables-1.10.15/js/dataTables.bootstrap.min.js"></script>
    </cfif>

    <script type="text/javascript">
      <cfif ListFindNoCase("SearchResults,ResultsCrawler", req.page)>
        $(document).ready(function() {
          $('#results').DataTable();
        } );
      </cfif>

      <cfif ListFindNoCase("KeyDetails,OtherKeyDetails", req.page)>
        $(document).ready(function() {
          $('#keydetails').DataTable( {
            "paging":   false,
          } );
        } );
      </cfif>

      <cfif ListFindNoCase("EntityDetails", req.page)>
        $(document).ready(function() {
          $('#details').DataTable( {
            "paging":   false,
            "ordering": false,
            "info":     false
          } );
        } );
      </cfif>

      <cfif ListFind("KeyResults", req.page)>
        $(document).ready(function() {
          $('#keyresults').DataTable( {
            "paging":   false,
            "searching": false
          } );
        } );
      </cfif>

    </script>
  </body>
</html>
