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
  });

  $("#product_user_content .editable").keyup(function(){
    $(this).removeClass("text-muted");
    field = $("#product_user_" + $(this).parent().attr("id"));
    field.val( $(this).text() );
  });

  // Dragging and editable
  $(".element").draggable({cursor: 'move'});
  $(".element").click(function(){
    $(this).draggable( {disabled: true});
    $(this).find(".editable").focus();
  }).mousedown(function(){
    $(this).draggable( {disabled: false});
  }).mouseleave(function(){
    $(this).draggable( {disabled: false});
  });

  // Editable Toolbar
  $(".editable").popline({
    position: "fixed"
  });

  // Wysiwyg
  // $('#editor').wysiwyg();
  //
  window.onbeforeunload = function(e) {
    return 'Perderás todas las modificaciones hechas hasta ahora.';
  };

});
