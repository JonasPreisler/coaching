$( document ).on('turbolinks:load', function() {

  function setInitialModalState() {
    $('#step1next').attr('disabled', 'disabled');
    $('#step2next').attr('disabled', 'disabled');
    $('#step-2').addClass('not-active');
    $('#step-3').addClass('not-active');
  }

  function companyButtonListener() {
    $('form#new_tutor #tutors-registration-submit-as-company').on('click', function(){
      openCompanyModal();
    });
  }

  function openCompanyModal(){
    $('#modal-window').modal();
  }

  function organisationNumberInputListener() {
    $('#org-numbr').on('keyup',function(){
      var organisationNumber = $('#org-numbr').val();

      if(organisationNumber.length < 9) { return false; }

      $('#step1next').attr('disabled', false);
      $('#step-2').removeClass('not-active');
    });
  }

  function companyRadionListener() {
    $('.company_type_radio').on('click', function(){
      $('#step2next').attr('disabled', false);
      $('#step-3').removeClass('not-active');
    });
  }

  function submitModalFirstStepListener() {
    $('#step1next').on('click', function(){
      var organisationNumber = $('#org-numbr').val();

      if(organisationNumber != '') {
        $("#step-2").click();
      } else {
        alert('Vennligst fyll ut alle feltene.');
      }
    });
  }

  function submitModalSecondStepListener() {
    $('#step2next').on('click', function(){
        company_type = $("input[name='company_type']:checked").val();
        if(company_type != undefined) {
          $('#step-3').click();
        } else {
          alert('Vennligst fyll ut alle feltene.');
        }
    });
  }

  $('form#new_tutor').on('keyup', '#org-numbr', function() {

    var organisationNumber = $('#org-numbr').val();

    if( organisationNumber.length != 9) { return false; }

    validateOrganisationNumber(organisationNumber);
  })

  function validateOrganisationNumber(organisationNumber) {
    var brregApiUrl = 'https://data.brreg.no/enhetsregisteret/api/enheter/' + organisationNumber;

    $.get(brregApiUrl, function(data) {
      validOrganisationNumberEvent(data);
    })
      .error(function(error) {
        invalidOrganisationNumberEvent();
      })
  }

  function validOrganisationNumberEvent(data) {
    $('#org-numbr').parent().addClass('has-success');
    $('#org-numbr').parent().removeClass('has-error');

    var companyType = data['organisasjonsform']['kode'];
    $('input[name=company_type][value=' + companyType + ']').attr('checked', 'checked');

    var companyName = data['navn'];
    $('input#company-name').val(companyName);
  }

  function invalidOrganisationNumberEvent() {
    $('#org-numbr').parent().removeClass('has-success');
    $('#org-numbr').parent().addClass('has-error');
  }

  companyButtonListener();
  setInitialModalState();
  organisationNumberInputListener();
  submitModalFirstStepListener();
  companyRadionListener();
  submitModalSecondStepListener();
});
