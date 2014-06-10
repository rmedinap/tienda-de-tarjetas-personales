$(function(){
  $("#search").validate({
    errorLabelContainer: $("#search div.error"),
    messages: {
      search: {
        required: 'Ingrese datos.'
      }
    }
  });
});
