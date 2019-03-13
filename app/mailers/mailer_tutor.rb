class MailerTutor < Devise::Mailer
  default from: 'bestdealerchat@jonaspreisler.com'
  layout 'mailer'

  def tutor_approved(tutor)
  	@tutor = tutor
    mail(to: tutor.email, subject: 'Du er godkendt.')
  end
end