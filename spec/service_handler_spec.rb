require 'spec_helper'

describe HttpMailer::ServiceHandler do

  describe "#initialize" do
    let(:settings){ {:host => "host.com", :api_user=> "test_api_user", :api_key => "1357924680"} }
    let(:service_handler){ HttpMailer::ServiceHandler.new(settings) }

    it "creates an instance" do
      expect(service_handler).to respond_to(:service_api)
      expect(service_handler).to respond_to(:service_configuration)
    end
  end

end