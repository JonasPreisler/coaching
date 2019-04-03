class MailerTutor < Devise::Mailer
  default from: 'bestdealerchat@jonaspreisler.com'
  layout 'mailer'

  def tutor_approved(tutor)
  	@tutor = tutor
    mail(to: tutor.email, subject: 'Du er godkendt!')
  end

  def review_received(tutor,review)
  	@tutor = tutor
  	@review = review
    mail(to: tutor.email, subject: 'Du har mottatt en anmeldelse!')
  end
end