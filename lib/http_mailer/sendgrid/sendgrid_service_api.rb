module HttpMailer
  class SendGridServiceApi
    attr_accessor :host, :protocol

    def initialize(host, protocol='https')
      @host = host
      @protocol = protocol
    end

    def messages_url
      "#{self.protocol}://#{self.host}/api/mail.send.json"
    end
  end
end