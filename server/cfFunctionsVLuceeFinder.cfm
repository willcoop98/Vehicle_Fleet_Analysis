<cfscript>
tagTallies = {};
linesOfCode = 0;
overallTally = 0;

directoryList("/Users/willcc/Sites/", true, "array", "*.cf?", "directory, name").each(function(filePath){
  var code = fileRead(filePath);
  linesOfCode += code.ListLen(Chr(13) & Chr(10));

  reMatchNoCase("deserialize?(xml|)|serializexml|getColumnList", code).each(function(tag){
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
