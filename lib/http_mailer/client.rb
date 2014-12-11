module HttpMailer
  class Client
    attr_reader :configuration, :mailgun, :sendgrid, :mandrill

    def initialize(settings)
      configure(settings)
    end

    def configure(settings)
      @mailgun = MailgunServiceHandler.new(settings[:mailgun])
      @sendgrid = SendGridServiceHandler.new(settings[:sendgrid])
      @mandrill = MandrillServiceHandler.new(settings[:mandrill])
    end

    def send_message(from, to, subject, body, from_name='', to_name='')
      response = nil

      [sendgrid, mailgun, mandrill].each do |service|
        if service.configured?
          response = service.send_message(from, to, subject, body, to_name, from_name)
          break if response.code == 200
        end
      end

      return response
    end

  end
end