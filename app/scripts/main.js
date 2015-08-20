'use strict';
_.extend($('input'), Backbone.Events);
$('input').on('input', function(){
  $('#' + $(this).attr('id') + '-val').html($(this).val());
  switch($(this).attr('id')){
    case 'birth-day':
    case 'birth-month':
      $('#' + $(this).attr('id') + '-val').html($('#' + $(this).attr('id') + '-val').html() + '.')
      break;
  }
});
$('select').on('change', function(){
  $('#' + $(this).attr('id') + '-val').html($(this).val());
});
