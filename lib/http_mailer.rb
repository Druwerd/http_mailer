require 'rest_client'
require "http_mailer/version"
require "http_mailer/client"
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
  class EmailDeliveryError < StandardError; end
  
  class << self
    def client(settings)
      HttpMailer::Client.new(settings)
    end
  end

end
