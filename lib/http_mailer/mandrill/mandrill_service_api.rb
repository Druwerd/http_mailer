module HttpMailer
  class MandrillServiceApi
    attr_accessor :host, :protocol, :version

    def initialize(host, protocol='https', version='1.0')
      @host = host
      @protocol = protocol
      @version = version
    end

    def send_messages_url
      "#{api_root_url}/messages/send.json"
    end

    private
    def api_root_url
      "#{self.protocol}://#{self.host}/api/#{self.version}"
    end
  end
end