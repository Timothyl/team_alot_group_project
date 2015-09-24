$(function(){
  $(".button-edit-form").on("click", function(){
    var $panel = $(this).closest(".panel");
    var $form = $panel.find(".form-div");
    $form.toggleClass("hide");
  });
});

$(function(){
  $(".button-new-form").on("click", function(){
    debugger;
    var $div = $(this).closest(".new-review");
    var $form = $div.find(".reviewform");
    $form.toggleClass("hide");
  });
});
