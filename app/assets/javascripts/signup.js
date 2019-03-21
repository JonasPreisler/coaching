$(document).ready(function(){

  $('.next').click(function(){
  
    var nextId = $(this).parents('.fade').next().attr("id");
    $('[href=#'+nextId+']').tab('show');
    return false;
    
  })
  
  $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
    
    //update progress
    var step = $(e.target).data('step');
    var percent = (parseInt(step) / 3) * 100;
    
    $('.progress-bar').css({width: percent + '%'});
    $('.progress-bar').text("Trinn " + step + " 3");
    
    //e.relatedTarget // previous tab
    
  })
  
  $('.first').click(function(){
  
    $('#myWizard a:first').tab('show')
  
  })

});