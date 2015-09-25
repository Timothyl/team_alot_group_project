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

$('.edit_button').click(function(event){
  event.preventDefault();
  header = $(this).closest('.form-div').find('#review_header')
  body = $(this).closest('.form-div').find('#review_body')
  rating = $(this).closest('.form-div').find('#review_rating')
  debugger;
  if(header.val().length == 0){
    alert("Header cannot be empty");
  }else if(body.val().length == 0){
    alert("Body cannot be empty");
  }else if(body.val().length < 30){
    alert("Body must be at least 30 characters");
  }else if(rating.val().length == 0){
    alert("rating cannot be blank");
  }else if(rating.val() > 5 || rating.val() < 1){
    alert("rating must be between 1 and 5")
  }else{
    $(this).closest('.edit_review').submit();
  }
});
