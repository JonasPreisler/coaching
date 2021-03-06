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
//= require rails-ujs
//= require jquery-ui/widgets/datepicker
//= require jquery.timepicker
//= require jquery.timepicker.min

//= require turbolinks

//= require toastr

//= require bootstrap
//= require bootstrap.min
//= require bootstrap-toggle
//= require bootstrap-select

//= require Chart.bundle
//= require chartkick

//= require moment 

//= require jquery.raty
//= require modal

//= require activestorage

//= require carousel

//= require select2
//= require jquery_nested_form
//= require cable
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
	$('.selectpicker').selectpicker();

    $('b[role="presentation"]').hide();

    $('.select2-selection__arrow').append('<i class="fa fa-arrow-down"></i>');
    $( ".select2-dropdown" ).select2();
});

// lets datepicker display selected date with "  <input type="text" id="d" disabled="true" />"

document.addEventListener("turbolinks:load", function() {
  $('#d').change(function() {
    $('#z').datepicker('setDate', $(this).val());
  });
});


// bootstrap datetime picker
document.addEventListener("turbolinks:load", function() {
  $(".form_datetime").datetimepicker({format: 'yyyy-mm-dd hh:ii'});
});

document.addEventListener("turbolinks:load", function() {
  $('#scrollDefaultExample').timepicker({ 'scrollDefault': 'now' });
});


