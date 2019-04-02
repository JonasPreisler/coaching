var token = undefined;
$(function() {
  var $form = $('#payment-form');
  $form.submit(function(event) {
    $form.find('.submit').val('Please Wait...').prop('disabled', true);
    if(token == undefined){
      // Request a token from Stripe:
      Stripe.card.createToken($form, stripeResponseHandler);
      return false;
    }else{
      return true
    }
  });
});

function stripeResponseHandler(status, response) {
  var $form = $('#payment-form');

  if (response.error) { 
    $form.find('.payment-errors').text(response.error.message);
    // Re-enable submission
    $form.find('.submit').val('Check Out').prop('disabled', false);
    token = undefined;
  } else { 
    // Get the token ID:
    token = response.id;
    console.log("stripe token"+ token);
    // Insert the token ID into the form so it gets submitted to the server:
    $form.append($('<input type="hidden" name="stripeToken">').val(token));
    $(".strip-form").submit();
  }
};
