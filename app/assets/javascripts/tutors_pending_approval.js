function checkOne(tutor_id){
  $('.tutors_pending_approval_list'+tutor_id).on('change', function() {
     $('.tutors_pending_approval_list'+tutor_id).not(this).prop('checked', false);
  });
}
