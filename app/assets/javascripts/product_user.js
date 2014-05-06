$(function() {

  // Load text to divs
  $("#product_user_content .element").each(function(){
    field = $("#product_user_" + $(this).attr("id"));
    text = field.val().length == 0 ? field.attr("placeholder") : field.val();
    $(this).text( text );
  });

  $("#product_user_form input").keyup(function(e) {
    div = $(this).attr('id').split("product_user_")[1];
    $("#"+div).text($(this).val());
  });

  // Dragging
  $( ".element" ).draggable({cursor: 'move'});

});
