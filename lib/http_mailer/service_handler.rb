module HttpMailer
  class ServiceHandler
    attr_accessor :service_api, :service_configuration

    def initialize(settings)
      @service_configuration = ServiceConfiguration.new(settings)
    end

    def configured?
      !self.service_configuration.settings.host.nil? &&
      !self.service_configuration.settings.api_key.nil?
    end

  end
end