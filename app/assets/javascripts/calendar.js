$(function() {
  $('.fa-calendar').click(function() {
    if ($("#toggle-stats").css("display") == "none")
    {      
      $("html, body").animate({
        scrollTop: $("#anchor").offset().top
      }, 1000);
    }

    $("#toggle-stats").slideToggle("slow", function() {
    });
  });
});
