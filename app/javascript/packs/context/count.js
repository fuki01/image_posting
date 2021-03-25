$(function(){
  $("#input-text-body").on("keyup", function() {
    let countNum = 200 - String($(this).val().length);
    if (countNum < 0) {
      $("#counter").css('color', 'red');
    }else{
      $("#counter").css('color', 'black');
    }
    $("#counter").text("残り" + countNum + "文字");
  });
  $("#input-text-category").on("keyup", function() {
    let countNum = 10 - String($(this).val().length);
    if (countNum < 0) {
      $("#category").css('color', 'red');
    }else{
      $("#category").css('color', 'black');
    }
    $("#category").text("残り" + countNum + "文字");
  });
 });