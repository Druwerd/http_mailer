module HttpMailer
  class SendGridServiceHandler < ServiceHandler
    attr_accessor :sevice_api

    def initialize(settings)
      super(settings)
      @service_api = ::HttpMailer::SendGridServiceApi.new(self.service_configuration.settings.host)
    end

    def send_message(from, to, subject, text, to_name='', from_name='')
      ::RestClient.post self.service_api.send_messages_url,
        :api_user => self.service_configuration.settings.api_user,
        :api_key => self.service_configuration.settings.api_key,
        :from => from,
        :fromname => from_name,
        :to => to,
        :toname => to_name,
        :subject => subject,
        :text => text
    rescue => e
      puts e.inspect
      e.response
    end

  end
end