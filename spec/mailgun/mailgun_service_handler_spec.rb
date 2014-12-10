require 'spec_helper'

describe HttpMailer::MailgunServiceHandler do
  
  describe "#send_message" do
    let(:settings){ {:host => "api.mailgun.net", :api_key => "12345", :subdomain => "sandbox12345.mailgun.org"} }
    let(:mailer){ HttpMailer::MailgunServiceHandler.new(settings) }
    let(:sender){ "Mailgun Sandbox <postmaster@sandbox12345.mailgun.org>"}
    let(:reciever){ "Test <test@gmail.com>" }
    let(:subject){ "Hello" }
    let(:email_body){ "Congratulations, you just sent an email with Mailgun!  You are truly awesome!" }

    it 'sends an email message' do
      response = mailer.send_message(sender, reciever, subject, email_body)
      expect(response.code).to eq(200)
    end
  end

  describe "#configured?" do
    context "fully configured" do
      let(:settings){ {:host => "api.mailgun.net", :api_key => "12345", :subdomain => "sandbox12345.mailgun.org"} }
      let(:mailer){ HttpMailer::MailgunServiceHandler.new(settings) }

      it 'returns true' do
        expect(mailer.configured?).to be true
      end
    end

    context "not fully configured" do
      let(:no_settings){ {} }
      let(:mailer_with_no_settings){ HttpMailer::MailgunServiceHandler.new(no_settings) }

      let(:settings_missing_host){ {:api_key => "12345", :subdomain => "sandbox12345.mailgun.org"} }
      let(:mailer_missing_host){ HttpMailer::MailgunServiceHandler.new(settings_missing_host) }

      let(:settings_missing_api_key){ {:host => "api.mailgun.net", :subdomain => "sandbox12345.mailgun.org"} }
      let(:mailer_missing_api_key){ HttpMailer::MailgunServiceHandler.new(settings_missing_api_key) }

      let(:settings_missing_subdomain){ {:host => "api.mailgun.net", :api_key => "12345"} }
      let(:mailer_missing_subdomain){ HttpMailer::MailgunServiceHandler.new(settings_missing_subdomain) }

      it 'returns false' do
        expect(mailer_with_no_settings.configured?).to be false
        expect(mailer_missing_host.configured?).to be false
        expect(mailer_missing_api_key.configured?).to be false
        expect(mailer_missing_subdomain.configured?).to be false
      end
    end
  end
end