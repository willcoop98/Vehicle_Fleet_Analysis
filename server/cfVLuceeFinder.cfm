<cfscript>
tagTallies = {};
linesOfCode = 0;
overallTally = 0;

directoryList("[LOCAL DIRECTORY]", true, "array", "*.cf?", "directory, name").each(function(filePath){
  var code = fileRead(filePath);
  linesOfCode += code.ListLen(Chr(13) & Chr(10));

  reMatchNoCase("<cf?(_socialplugin|c(alendar|lient(settings|))|exchange?(calendar|connection|contact|conversation|folder|filter|mail|task)|fileupload|form(group|item)|grid?(column|row|update|)|htmltopdf(item|)|imapfilter|menu(item|)|messagebox|ntauthenticate|oauth|pdf(sub|)form(param|)|pod|present(er|ation(slide|))|print|progressbar|report(param|)|sharepoint|spr(eadsheet|ydataset)|t(extarea|ooltip|ree(item|))|websocket)", code).each(function(tag){
    var tagName = tag.removeChars(1, 3);
    WriteOutput(filePath & "; " & "<b>" & tagName & "</b>" & "<br/>");
    overallTally++
    if (StructKeyExists(tagTallies, tagName)){
      tagTallies[tagName]++;
    } else {
      tagTallies[tagName] = 1;
    }
  });
});
WriteOutput('<table border="1"><thead><tr><th>Place</th><th>Tag</th><th>Count</th><th>Percent</th></tr></thead><tbody>');
tagTallies.sort("numeric", "DESC").each(function(v){
  param place=0;
  if (tagTallies[v]){
    writeOutput("<tr><td>#++place#</td><td>#v#</td><td>#tagTallies[v]#</td><td>#numberFormat((tagTallies[v]/overallTally)*100,'99.99')#</td></tr>");
  }
});

writeOutput("</tbody></table>");
writeDump({linesOfCode=linesOfCode});
</cfscript>
