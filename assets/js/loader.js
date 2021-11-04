var xml = "/assets/examples/fable.xml";
var xslt = "/assets/xslt/affichage-client.xsl";

function outline() {
  $.when($.get(xml),$.get(xslt)).done(function(x,y,z) {
    xsltProcessor = new XSLTProcessor();
    xsltProcessor.importStylesheet(y[0]);
    content = xsltProcessor.transformToDocument(x[0]),
    $("#main").append(content);
  });
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
