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

  describe "#configured?" do
    context "fully configured" do
      let(:settings){ {:host => "mandrillapp.com", :api_key => "1234567890"} }
      let(:mailer){ HttpMailer::ServiceHandler.new(settings) }

      it 'returns true' do
        expect(mailer.configured?).to be true
      end
    end

    context "not fully configured" do
      let(:no_settings){ {} }
      let(:mailer_with_no_settings){ HttpMailer::ServiceHandler.new(no_settings) }

      let(:settings_missing_host){ {:api_key => "1234567890"} }
      let(:mailer_missing_host){ HttpMailer::ServiceHandler.new(settings_missing_host) }

      let(:settings_missing_api_key){ {:host => "mandrillapp.com"} }
      let(:mailer_missing_api_key){ HttpMailer::ServiceHandler.new(settings_missing_api_key) }

      it 'returns false' do
        expect(mailer_with_no_settings.configured?).to be false
        expect(mailer_missing_host.configured?).to be false
        expect(mailer_missing_api_key.configured?).to be false
      end
    end
  end

end