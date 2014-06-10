$(function(){
  $("#order_proof_type").change(function(){
    proof_type = $("#order_proof_type :selected").text();
    if (proof_type == "Factura"){
      $("#proof_type_label").html("<abbr title='obligatorio'>*</abbr> RUC");
      $("#proof_type").removeClass("hidden");
    }else{
      $("#proof_type_label").html("<abbr title='obligatorio'>*</abbr> DNI");
      $("#proof_type").removeClass("hidden");
    }
  });
  $("#order_proof_type").trigger("change");
});
