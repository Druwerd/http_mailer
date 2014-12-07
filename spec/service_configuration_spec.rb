require 'spec_helper'

describe HttpMailer::ServiceConfiguration do

  describe "#initialize" do
    let(:settings){ {:host => "test.com", :api_user => "test_api_user", :api_key => "test_api_key", :subdomain => "test_subdomain"} }
    let(:service_configuration){ HttpMailer::ServiceConfiguration.new(settings) }

    it "creates an instance" do
      expect(service_configuration).to respond_to(:settings)
      expect(service_configuration.settings.host).to eq(settings[:host])
      expect(service_configuration.settings.api_user).to eq(settings[:api_user])
      expect(service_configuration.settings.api_key).to eq(settings[:api_key])
      expect(service_configuration.settings.subdomain).to eq(settings[:subdomain])
    end
  end
  
end