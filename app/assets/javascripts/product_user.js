$(function() {

  // Load text to divs
  $("#product_user_content .editable").each(function(){
    field = $("#product_user_" + $(this).parent().attr("id"));
    text = field.val().length == 0 ? field.attr("placeholder") : field.val();
    $(this).text( text ).addClass("text-muted");
  });

  $("#product_user_form input").keyup(function(e) {
    div = $(this).attr('id').split("product_user_")[1];
    $("#" + div + " .editable").text($(this).val()).removeClass("text-muted");
    html = get_html();
    draw(html);
  });

  $("#product_user_content .editable").keyup(function(){
    $(this).removeClass("text-muted");
    field = $("#product_user_" + $(this).parent().attr("id"));
    field.val( $(this).text() );
    // draw($(this).html());
  });

  // Dragging and editable
  $(".element").draggable({cursor: 'move'});
  $(".element").click(function(){
    $(this).draggable( {disabled: true});
    $(this).find(".editable").focus();
  }).mousedown(function(){
    $(this).draggable( {disabled: false});
    html = get_html();
    draw(html);
  }).mouseleave(function(){
    $(this).draggable( {disabled: false});
  });

  // Editable Toolbar
  $(".editable").popline({
    position: "fixed"
  });

  // Reload page warning
  if ($("#current_page").length > 0 ){
    window.onbeforeunload = function(e) {
      return 'Perderás todas las modificaciones hechas hasta ahora.';
    };
  }


  $("#op").click(function(){
    window.open('', document.getElementById('canvas').toDataURL());
    // window.open('', $('#canvas').toDataURL());
  });
});

// Draw test
function draw(content) {
  var canvas = $('#canvas').get(0);

  if (canvas.getContext){
    var ctx = canvas.getContext('2d');
    console.log("soporta 2d");
    ctx.drawImage(document.getElementById('background_card'),0,0);

    var data = '<svg xmlns="http://www.w3.org/2000/svg" width="200" height="200">' +
    '<foreignObject width="100%" height="100%">' +
    '<div xmlns="http://www.w3.org/1999/xhtml" style="font-size:14px; font-family: Helvetica Neue, Helvetica, Arial, sans-serif;">' +
    content +
    '</div>' +
    '</foreignObject>' +
    '</svg>';
    var DOMURL = window.URL || window.webkitURL || window;
    var img = new Image();
    var svg = new Blob([data], {type: 'image/svg+xml;charset=utf-8'});
    var url = DOMURL.createObjectURL(svg);

    img.onload = function () {
      ctx.drawImage(img, 0, 0);
      DOMURL.revokeObjectURL(url);
    }

    $("#img_canvas").attr("src", url);

    img.src = url;

    // var strDataURI = canvas.toDataURL();
    // return document.getElementById('product_user_content');
    // savedData = new Image();
    // savedData.src = canvas.toDataURL("image/png");
    console.log("Soporta 2d");
    // console.log(strDataURI);
  } else {
    console.log("No soporta 2d");
  }
}

function get_html(){
  container = $("#product_user_content");
  html = container.html();
  html = html.replace($("#product_user_background").html(), "");
  html = html.replace(/\s+/g, ' ');
  return html;
}
