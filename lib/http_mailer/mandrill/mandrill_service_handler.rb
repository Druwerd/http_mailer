module HttpMailer
  class MandrillServiceHandler < ServiceHandler
    attr_accessor :sevice_api

    def initialize(settings)
      super(settings)
      @service_api = ::HttpMailer::MandrillServiceApi.new(self.service_configuration.settings.host)
    end

    def send_message(from, to, subject, text, from_name='', to_name='')
      message = MandrillMessage.new(from, to, subject, text, nil, from_name, to_name)
      payload = {
        :key => self.service_configuration.settings.api_key,
        :message => message.to_h
      }.to_json

      ::RestClient.post(self.service_api.send_messages_url, payload,
        :content_type => :json,
        :accept => :json
      )
    rescue => e
      puts e.inspect
      e.response
    end

  end
end