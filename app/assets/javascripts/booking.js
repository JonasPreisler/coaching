$(document).ready(function(){

  var timeStep = 5;

  function selectTimeSlotListener() {
    $('.time').on('click', '.time-picker', function() {

      $(this).toggleClass('time-checked')

      if ($('.time-checked').length <= 1 ) {
        return false;
      } else if ($('.time-checked').length == 2) {
        markSelectedTimeSlots();
      } else {
        resetAllTimeSlots($(this));
      }
    })
  }

  function markSelectedTimeSlots() {
    ($('.time-checked:first').parent()).nextUntil($('.time-checked:last').parent()).each(function() {
      $(this).find('.time-picker').addClass('time-checked');
    });
  }

  function resetAllTimeSlots(clicked) {
    $('.time').find('.time-checked').removeClass('time-checked');

    clicked.addClass('time-checked');
  }

  selectTimeSlotListener();
})
