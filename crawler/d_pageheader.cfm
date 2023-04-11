<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>
      <cfoutput>
        #req.page#
      </cfoutput>
    </title>

    <cfparam name="req.Type" default="">
    <cfparam name="req.Unitname" default="">
    <cfparam name="req.State" default="">
    <cfparam name="req.Crawlterms" default="">
    <cfparam name="req.Statecode" default="">
    <cfparam name="req.Typecode" default="">
    <cfparam name="req.Countycode" default="">
    <cfparam name="req.Unitcode" default="">

    <!-- Bootstrap -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.min.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->

    <!-- Data Tables -->
    <cfif ListFindNoCase("SearchResults,EntityDetails,KeyResults,KeyDetails,ResultsCrawler", req.page)>
      <link rel="stylesheet" type="text/css" href="DataTables-1.10.15/css/dataTables.bootstrap.min.css"/>
      <link rel="stylesheet" type="text/css" href="DataTables-1.10.15/css/jquery.dataTables.min.css"/>
    </cfif>

  </head>
  <body>
    <nav class="navbar navbar-default">
      <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Tool</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav">
            <cfloop index="n" array="#nav#">
              <cfset class = ListFindNoCase(n.pages, req.page) ? "active " : "" & StructKeyExists(n, "disabled") ? "disabled " : "">
              <cfoutput>
                <li class="#class#"><a href="index.cfm?page=#n.link#">#n.term# <span class="sr-only">(current)</span></a></li>
              </cfoutput>
            </cfloop>
          </ul>
        </div>
      </div>
    </nav>

    <div class="container">
