var xml = "examples/fable.xml";
var xslt = "xslt/affichage.xsl";

function outline() {
  var ver = localStorage.getItem("version");
  $.when($.get(xml),$.get(ver),$.get(xslt)).done(function(x,y,z) {
    xsltProcessor = new XSLTProcessor();
    xsltProcessor.importStylesheet(y[0]);
    var textVersion = xsltProcessor.transformToDocument(x[0]),
	content = transformSanskrit(textVersion,z[0]);
    console.log(textVersion);
    console.log(content);
    $("#xml-content").append(content);
  });
}

var xsltProcessor = new XSLTProcessor();

// Load the xsl file using synchronous (third param is set to false) XMLHttpRequest
var myXMLHTTPRequest = new XMLHttpRequest();
myXMLHTTPRequest.open("GET", xslt, false);
myXMLHTTPRequest.send(null);

var xslRef = myXMLHTTPRequest.responseXML;

// Finally import the .xsl
xsltProcessor.importStylesheet(xslRef);

// create a new XML document in memory
var xmlRef = document.implementation.createDocument("", "", null);

// we want to move a part of the DOM from an HTML document to an XML document.
// importNode is used to clone the nodes we want to process via XSLT - true makes it do a deep clone
var myNode = document.getElementById("xml-content");
var clonedNode = xmlRef.importNode(myNode, true);

// add the cloned DOM into the XML document
xmlRef.appendChild(clonedNode);
