$(document).ready(function(){

  function setInitialModalState() {
    $('#step1next').attr('disabled', 'disabled');
    $('#step2next').attr('disabled', 'disabled');
    $('#step-2').addClass('not-active');
    $('#step-3').addClass('not-active');
  }


  function openCompanyModal(identifier){
    $('#modal-window').modal();
  }

  function organisationNumberInputListener() {
    $('#org-numbr').on('keyup',function(){
      $('#step1next').attr('disabled', false);
      $('#step-2').removeClass('not-active');
    });
  }

  function companyRadionListener() {
    $('.company_type_radio').on('click',function(){
      $('#step2next').attr('disabled', false);
      $('#step-3').removeClass('not-active');
    });
  }

  function submitModalFirstStepListener() {
    $('#step1next').on('click', function(){
      var orgValue = $('#org-numbr').val();

      if(orgValue != '') {
        $('#step-2').click();
      } else {
        alert('Please fill step parameters.');
      }
    });
  }

  function submitModalSecondStepListener() {
    $('#step2next').on('click', function(){
        company_type = $("input[name='company_type']:checked").val();
        if(company_type != undefined) {
          $('#step-3').click();
        } else {
          alert('Please fill step parameters.');
        }
    });
  }


  // });
  // $("#step2next").on("click", function(){
  //   if ($("#step2next").attr("disabled") == 'disabled'){
  //     alert("fill required field");
  //    }else{
  //     $("#step-3").click();
  //    }
  // });
  // $('#step-2').click( function() {
  // if( $(this).attr('rel') == 'disabled' ) { return; }
  //   return false; // so your '#' href doesn't get used
  // } );

  // $('#step-3').click( function() {
  // if( $(this).attr('rel') == 'disabled' ) { return; }
  //   // do stuff here when not disabled
  //   return false; // so your '#' href doesn't get used
  // });

  setInitialModalState();
  organisationNumberInputListener();
  submitModalFirstStepListener();
  companyRadionListener();
  submitModalSecondStepListener();
});

$(document).on("click", 'form#new_tutor #tutors-registration-submit-as-company', function(){
  openCompanyModal($(this));
});

