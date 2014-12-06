module HttpMailer
  class ServiceConfiguration
    Settings = Struct.new(:host, :api_key, :api_user, :subdomain)
    attr_accessor :settings

    def initialize(settings_hash)
      self.settings = Settings.new

      self.settings.host      = settings_hash[:host]
      self.settings.api_user  = settings_hash[:api_user]
      self.settings.api_key   = settings_hash[:api_key]
      self.settings.subdomain = settings_hash[:subdomain]
    end

  end
end