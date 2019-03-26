$( document ).on('turbolinks:load', function() {

  function setInitialModalState() {
    $('#step1next').attr('disabled', 'disabled');
    $('#step2next').attr('disabled', 'disabled');
    $('#step-2').addClass('not-active');
    $('#step-3').addClass('not-active');
  }

  function companyButtonListener() {
    $('#new-booking').on('click', function(){
      openCompanyModal();
    });
  }

  function openCompanyModal(){
    $('#modal-window-booking').modal();
  }

  function companyRadionListener() {
    $('.company_type_radio').on('click', function(){
      $('#step2next').attr('disabled', false);
      $('#step-3').removeClass('not-active');
    });
  }

  function submitModalFirstStepListener() {
    $('#step1next').on('click', function(){
      var organisationNumber = $('#offer_id').val();

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


  function validOrganisationNumberEvent(data) {
    $('#offer_id').parent().addClass('has-success');
    $('#offer_id').parent().removeClass('has-error');

    var companyType = data['organisasjonsform']['kode'];
    $('input[name=company_type][value=' + companyType + ']').attr('checked', 'checked');

    var companyName = data['navn'];
    $('input#company-name').val(companyName);
  }

  function invalidOrganisationNumberEvent() {
    $('#offer_id').parent().removeClass('has-success');
    $('#offer_id').parent().addClass('has-error');
  }

  companyButtonListener();
  setInitialModalState();
  organisationNumberInputListener();
  submitModalFirstStepListener();
  companyRadionListener();
  submitModalSecondStepListener();
});
