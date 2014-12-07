module HttpMailer
  class MailgunServiceHandler < ServiceHandler
    attr_accessor :sevice_api

    def initialize(settings)
      super(settings)
      @service_api = ::HttpMailer::MailgunServiceApi.new(self.service_configuration.settings.host,
        self.service_configuration.settings.api_key,
        self.service_configuration.settings.subdomain
      )
    end

    def send_message(from, to, subject, text)
      ::RestClient.post self.service_api.send_messages_url,
        :from => from,
        :to => to,
        :subject => subject,
        :text => text
    rescue => e
      puts e.inspect
      e.response
    end

  end
end