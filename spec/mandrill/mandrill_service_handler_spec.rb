require 'spec_helper'

describe HttpMailer::MandrillServiceHandler do
  
  describe "#send_message" do
    let(:settings){ {:host => "mandrillapp.com", :api_key => "1234567890"} }
    let(:mailer){ HttpMailer::MandrillServiceHandler.new(settings) }
    let(:from){ "papa@prose.com"}
    let(:from_name){ "Ernest Hemingway"}
    let(:to){ "jd@catcher.com" }
    let(:to_name){ "JD Salinger"}
    let(:subject){ "Hello" }
    let(:email_body){ "Congratulations, you just sent an email with Mandrill!  You are truly awesome!" }

    it 'sends an email message' do
      response = mailer.send_message(to, from, subject, email_body, to_name, from_name)
      expect(response.code).to eq(200)
    end
  end

  describe "#configured?" do
    context "fully configured" do
      let(:settings){ {:host => "mandrillapp.com", :api_key => "1234567890"} }
      let(:mailer){ HttpMailer::MandrillServiceHandler.new(settings) }

      it 'returns true' do
        expect(mailer.configured?).to be true
      end
    end

    context "not fully configured" do
      let(:no_settings){ {} }
      let(:mailer_with_no_settings){ HttpMailer::MandrillServiceHandler.new(no_settings) }

      let(:settings_missing_host){ {:api_key => "1234567890"} }
      let(:mailer_missing_host){ HttpMailer::MandrillServiceHandler.new(settings_missing_host) }

      let(:settings_missing_api_key){ {:host => "mandrillapp.com"} }
      let(:mailer_missing_api_key){ HttpMailer::MandrillServiceHandler.new(settings_missing_api_key) }

      it 'returns false' do
        expect(mailer_with_no_settings.configured?).to be false
        expect(mailer_missing_host.configured?).to be false
        expect(mailer_missing_api_key.configured?).to be false
      end
    end
  end
end