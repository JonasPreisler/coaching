class AdminMailer < Devise::Mailer
  default from: 'bestdealerchat@jonaspreisler.com'
  layout 'mailer'

  def new_tutor_waiting_for_approval(email)
    @email = email
    mail(to: 'jonas.preisler@gmail.com', subject: 'Ny rådgiver venter på godkjenning.')
  end
end