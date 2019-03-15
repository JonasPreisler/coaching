$( document ).ready(function() {

  $('b[role="presentation"]').hide();
  $('.select2-selection__arrow').append('<i class="fa fa-arrow-down"></i>');
  $( ".select2-dropdown" ).select2({
    theme: "bootstrap"
  });

 $('body').on('shown.bs.modal', '#modal-window', function (e) {
  var category_id = $(e.relatedTarget).data('category-id');
  $('#display_category_id').val(category_id);
 });

});
