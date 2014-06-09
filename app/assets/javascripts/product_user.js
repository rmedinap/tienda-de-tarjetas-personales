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
    // draw(html);
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
    // draw(html);
  }).mouseleave(function(){
    $(this).draggable( {disabled: false});
  });

  // Editable Toolbar
  $(".editable").popline({
    position: "fixed"
  });

  // Styles in element
  if ($("#current_page").length > 0 ){
    $(".product-user-content div").each(function(){
      styles = css($(this));
      $(this).css(styles);
    });
  }

  $("#product_user_form").submit(function(e) {
    // e.preventDefault();
    draw();
    src = $("#img_canvas").attr("src");
    $("#product_user_image_svg").val(src);
    console.log(src);
  });

});

// Draw test
function draw() {
  var content = get_html();
  var canvas = $('#canvas').get(0);

  if (canvas.getContext){
    var ctx = canvas.getContext('2d');
    console.log("soporta 2d");
    // ctx.drawImage(document.getElementById('background_card'),0,0);

    var data = '<svg xmlns="http://www.w3.org/2000/svg" width="620" height="363">' +
    '<foreignObject width="100%" height="100%">' +
    content +
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

    img.src = url;

    $("#img_canvas").attr("src", "data:image/svg+xml;charset=utf-8," + data);

  } else {
    console.log("No soporta 2d");
  }
}

function get_html(){
  container = $(".product-user-content");
  html = container.html();
  html = html.replace($("#product_user_background").html(), "");
  html = html.replace(/\s+/g, ' ');
  return html;
}

function css(a) {
  var sheets = document.styleSheets, o = {};
  for (var i in sheets) {
    var rules = sheets[i].rules || sheets[i].cssRules;
    for (var r in rules) {
      if (a.is(rules[r].selectorText)) {
        o = $.extend(o, css2json(rules[r].style), css2json(a.attr('style')));
      }
    }
  }
  return o;
}

function css2json(css) {
  var s = {};
  if (!css) return s;
  if (css instanceof CSSStyleDeclaration) {
    for (var i in css) {
      if ((css[i]).toLowerCase) {
        s[(css[i]).toLowerCase()] = (css[css[i]]);
      }
    }
  } else if (typeof css == "string") {
    css = css.split("; ");
    for (var i in css) {
      var l = css[i].split(": ");
      s[l[0].toLowerCase()] = (l[1]);
    }
  }
  return s;
}
