var xml = "malatimadhava.xml";
var xslt = "common-test.xsl";

function outline() {
  var ver = localStorage.getItem("version");
  $.when($.get(xml),$.get(ver),$.get(xslt)).done(function(x,y,z) {
    xsltProcessor = new XSLTProcessor();
    xsltProcessor.importStylesheet(y[0]);
    var textVersion = xsltProcessor.transformToDocument(x[0]),
	content = transformSanskrit(textVersion,z[0]);
    console.log(textVersion);
    console.log(content);
    $("#root").append(content);
  });
}
