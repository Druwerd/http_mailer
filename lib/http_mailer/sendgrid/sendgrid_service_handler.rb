module HttpMailer
  class SendGridServiceHandler < ServiceHandler
    attr_accessor :sevice_api

    def initialize(settings)
      super(settings)
      @service_api = ::HttpMailer::SendGridServiceApi.new(self.service_configuration.settings.host)
    end

    #curl -X POST https://sendgrid.com/api/mail.send.json -d api_user=druwerd -d api_key=XXXXXXXX -d to=druwerd@gmail.com -d toname=Dru -d subject=test -d text=hello this is a test -d from=dru@druwerd.com
    def send_message(from, to, subject, text, to_name='', from_name='')
      ::RestClient.post self.service_api.messages_url,
      :api_user => self.service_configuration.settings.api_user,
      :api_key => self.service_configuration.settings.api_key,
      :from => from,
      :fromname => from_name,
      :to => to,
      :toname => to_name,
      :subject => subject,
      :text => text
    end

  end
end