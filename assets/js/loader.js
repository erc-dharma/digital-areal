var xml = "/assets/examples/fable.xml";
var xslt = "/assets/xslt/affichage-client.xsl";

function outline() {
        xsltProcessor = new XSLTProcessor();
        xsltProcessor.importStylesheet(xslt);
        resultDocument = xsltProcessor.transformToFragment(xml, document);
        document.getElementById('#main').appendChild(resultDocument);
     }

var content = $("#root").append(content);
            outline();
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
