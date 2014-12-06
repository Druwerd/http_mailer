module HttpMailer
  class MailgunServiceApi
    attr_accessor :host, :api_key, :version, :subdomain, :protocol

    def initialize(host, api_key, subdomain, protocol='https', version='v2')
      @host = host
      @api_key = api_key
      @subdomain = subdomain
      @protocol = protocol
      @version = version
    end

    def messages_url
      "#{self.protocol}://api:key-#{self.api_key}@#{self.host}/#{self.version}/#{self.subdomain}/messages"
    end
  end
end