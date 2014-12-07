require 'rest_client'
require "http_mailer/version"
require "http_mailer/service_handler"
require "http_mailer/service_configuration"
require "http_mailer/mailgun/mailgun_service_api"
require "http_mailer/mailgun/mailgun_service_handler"
require "http_mailer/mandrill/mandrill_message"
require "http_mailer/mandrill/mandrill_service_api"
require "http_mailer/mandrill/mandrill_service_handler"
require "http_mailer/sendgrid/sendgrid_service_api"
require "http_mailer/sendgrid/sendgrid_service_handler"

module HttpMailer
  
  class << self
    def mailgun(settings)
      MailgunServiceHandler.new(settings)
    end

    def sendgrid(settings)
      SendGridServiceHandler.new(settings)
    end

    def mandrill(settings)
      MandrillServiceHandler.new(settings)
    end
  end
end
