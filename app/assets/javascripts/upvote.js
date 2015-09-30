$(".vote").click(function()
{
  var voteType = this.id;
  var parentId = this.parentElement;
  var reviewId = parentId.parentElement.id;
  var url = window.location.pathname;
  var foodTruckId = url.substring(url.lastIndexOf("/") + 1);
  $.ajax({
  METHOD: "POST",
  url: "/food_trucks/" + foodTruckId + "/votes",
  dataType: "JSON",
  data: { _method:"put", review_id: reviewId, vote_type: voteType,
         food_truck_id: foodTruckId },
  success: function(data)
  {
    $(parentId).children("#review_score").html(data);
  },
});
});
