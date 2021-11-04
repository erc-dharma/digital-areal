/*function loadXMLDoc(filename)
{
if (window.ActiveXObject)
  {
  xhttp = new ActiveXObject("Msxml2.XMLHTTP");
  }
else
  {
  xhttp = new XMLHttpRequest();
  }
xhttp.open("GET", filename, false);
try {xhttp.responseType = "msxml-document"} catch(err) {} // Helping IE11
xhttp.send("");
return xhttp.responseXML;
}

function displayResult()
{
xml = loadXMLDoc("digital-areal/assets/examples/fable.xml");
xsl = loadXMLDoc("digital-areal/assets/xslt/affichage-client.xsl");
// code for IE
if (window.ActiveXObject || xhttp.responseType == "msxml-document")
  {
  ex = xml.transformNode(xsl);
  document.getElementById("main").innerHTML = ex;
  }
// code for Chrome, Firefox, Opera, etc.
else if (document.implementation && document.implementation.createDocument)
  {
  xsltProcessor = new XSLTProcessor();
  xsltProcessor.importStylesheet(xsl);
  resultDocument = xsltProcessor.transformToFragment(xml, document);
  document.getElementById("main").appendChild(resultDocument);
  }
}*/

var xml= "https://erc-dharma.github.io/digital-areal/assets/examples/fable.xml";
var xsl="https://erc-dharma.github.io/digital-areal//assets/xslt/affichage-client.xsl"; 

function load(url, callback) {
  var req = new XMLHttpRequest();
  req.open('GET', url);
  // to allow us doing XSLT in IE
  try { req.responseType = "msxml-document" } catch (ex) {}
  req.onload = function() {
    callback(req.responseXML);
  };
  req.send();
}

function transform(xml, xsl) {
  load(
    xml,
    function(inputXml) {
      load(
        xsl,
        function(xsltSheet) {
          displayResult(inputXml, xsltSheet);
        }
      );
    }
  );
}

function displayResult(xmlInput, xsltSheet) {
  if (typeof XSLTProcessor !== 'undefined') {
    var proc = new XSLTProcessor();
    proc.importStylesheet(xsltSheet);
    document.getElementById('main').appendChild(proc.transformToFragment(xmlInput, document));
  }
  else if (typeof xmlInput.transformNode !== 'undefined') {
    document.getElementById("main").innerHTML = xmlInput.transformNode(xsltSheet);
  }
}

var content = $("#root").append(content);
            initializePopovers();

function initializePopovers() {
            $('[data-toggle="popover"]').popover({
            html : true,
            container: 'body',
            trigger : 'hover',
            content: function() {
            var idtarget = $(this).attr("data-target");
            console.log($('#'+idtarget));
            return $('#'+idtarget).html();
            }
            });
};

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
