require_relative 'boot'

require 'rails/all'


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Veiledning
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.assets.initialize_on_precompile = false
    config.action_mailer.default_url_options = { host: "vehiclecsv.herokuapp.com" }

    ActionMailer::Base.smtp_settings = {
    	address: "send.one.com",
    	domain: "jonaspreisler.com",
    	port: 587,
    	user_name: "bestdealerchat@jonaspreisler.com", #ENV["GMAIL_USERNAME"]
    	password: "password", #ENV["GMAIL_PASSWORD"]
    	authentication: :login,
    	enable_starttls_auto: true
    }

    config.exceptions_app = self.routes

  end
end
