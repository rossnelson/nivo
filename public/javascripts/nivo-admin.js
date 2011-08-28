$(document).ready(function() {
  $('#slides').slidedragsort({});

  $("#order_slides").click(function(){
    mylist = $('#slides').serializeSlidelist();
    $.post("/nivo/manage_slides", mylist);
    return false;
  });
});

