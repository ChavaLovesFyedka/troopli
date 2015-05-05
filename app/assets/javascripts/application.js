//= require jquery
//= require jquery_ujs
//= require vendor_scripts
//= require jquery.ui.autocomplete
//= require_tree .


var ready;
ready = (function() {
  $('a[href="' + this.location.pathname + '"]').parent().addClass('active');
  $("#badge").autocomplete({
    source: '/search/autocomplete.json',
  });
});

$(document).ready(ready);
$(document).on('page:load', ready);

$(document).ready(function(){
  $('#type').change(function(){
    if($(this).val()=='Badge'){
      $('#badge').show();
      $('#term').hide();
    } else {
      $('#term').show();
      $('#badge').hide();
    }
  });
});

