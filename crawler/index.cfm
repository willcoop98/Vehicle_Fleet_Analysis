<cfscript>

  include "l_pageheader.cfm";
  include "d_pageheader.cfm";

  switch(req.page){

    case "CrawlAll":
      include "q_crawlall.cfm";
      include "l_crawlall.cfm";
      include "d_crawlall.cfm";
      break;

    case "DetailsCrawler":
      include "q_detailscrawler.cfm";
      include "l_detailscrawler.cfm";
      include "d_detailscrawler.cfm";
      break;

    case "ResultsCrawler":
      include "q_buttoncrawlall.cfm";
      include "q_crawlerresults.cfm";
      include "q_unitType.cfm";
      include "d_formcrawler.cfm";
      include "d_crawlerresults.cfm";
      break;

    case "FormCrawler":
      include "q_unitType.cfm";
      include "d_formcrawler.cfm";
      break;

    case "KeyResults":
      include "q_keyresults.cfm";
      include "q_keytablehead.cfm";
      include "q_crawlTerms.cfm";
      include "q_unitType.cfm";
      include "d_keysearchform.cfm";
      include "d_keyresults.cfm";
      break;

    case "KeyDetails":
      include "q_censusdetails.cfm";
      include "q_other_foundterms.cfm";
      include "q_primary_foundterms.cfm";
      include "q_crawlURLdetails.cfm";
      include "d_keydetails.cfm";
      break;

    case "KeySearchForm":
      include "q_crawlTerms.cfm";
      include "q_unitType.cfm";
      include "d_keysearchform.cfm";
      break;

    case "SearchResults":
      include "q_searchresults.cfm";
      include "q_unitType.cfm";
      include "q_unitState.cfm";
      include "d_searchform.cfm";
      include "d_searchresults.cfm";
      break;

    case "EntityDetails":
      include "q_censusdetails.cfm";
      include "q_censusURLdetails.cfm";
      include "d_entitydetails.cfm";
      break;

    case "SearchForm":
    default:
      include "q_unitType.cfm";
      include "q_unitState.cfm";
      include "d_searchform.cfm";
      break;
  }

  if (StructKeyExists(req, "dump")) {
    include "d_dump.cfm";
  }
  include "d_pagefooter.cfm";

</cfscript>
