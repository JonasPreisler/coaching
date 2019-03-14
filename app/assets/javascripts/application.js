// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require bootstrap-toggle
//= require bootstrap-select
//= require select2
//= require bootstrap/modal
//= require activestorage
//= require_tree .

function myFunction(id) {
  var x = document.getElementById(id);
  $(x).slideToggle();
  $(x).siblings('.togglable-tr').hide();
}


$(document).on('ready page:change', function() {
  $('input[type="checkbox"].toggle').bootstrapToggle(); // assumes the checkboxes have the class "toggle"
});

document.addEventListener("turbolinks:load", function() {
	$('.selectpicker').selectpicker({
  });
});


document.addEventListener("turbolinks:load", function() {
    $('.select2-dropdown').select2();
    $('b[role="presentation"]').hide();
    $('.select2-selection__arrow').append('<i class="fa fa-arrow-down"></i>');
});

$( document ).ready(function() {
  $( ".select2-dropdown" ).select2({
      theme: "bootstrap"
  });
});

$( document ).ready(function() {
 $('body').on('shown.bs.modal', '#modal-window', function (e) {
  var category_id = $(e.relatedTarget).data('category-id');
  $('#display_category_id').val(category_id);
 });
});
