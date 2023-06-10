// Delay loading any function until the html dom has loaded. All functions are
// defined in this top level function to ensure private scope.

function UpdateGraphviz(graph) {
    var svg_div = jQuery('#graphviz_svg_div');
    svg_div.html("");
    // Generate the Visualization of the Graph into "svg".
    var svg = Viz(graph, "svg");
    svg_div.html("<hr>"+svg);
}

jQuery(document).ready(function () {

  // Installs error handling.
  jQuery.ajaxSetup({
  error: function(resp, e) {
    if (resp.status == 0){
      alert('You are offline!!\n Please Check Your Network.');
      } else if (resp.status == 404){
        alert('Requested URL not found.');
      } else if (resp.status == 500){
        alert('Internel Server Error:\n\t' + resp.responseText);
      } else if (e == 'parsererror') {
        alert('Error.\nParsing JSON Request failed.');
      } else if (e == 'timeout') {
        alert('Request timeout.');
      } else {
        alert('Unknown Error.\n' + resp.responseText);
      }
    }
  });  // error:function()


  


});
