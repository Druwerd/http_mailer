module HttpMailer
  class ServiceHandler
    attr_accessor :service_api, :service_configuration

    def initialize(settings)
      @service_configuration = ServiceConfiguration.new(settings)
    end

  end
end