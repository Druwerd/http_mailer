require 'spec_helper'

describe HttpMailer::MailgunServiceHandler do
  
  describe "#send_message" do
    let(:settings){ {:host => "api.mailgun.net", :api_key => "12345", :subdomain => "sandbox12345.mailgun.org"} }
    let(:mailer){ HttpMailer::MailgunServiceHandler.new(settings) }
    let(:sender){ "Mailgun Sandbox <postmaster@sandbox12345.mailgun.org>"}
    let(:reciever){ "Test <test@gmail.com>" }
    let(:subject){ "Hello" }
    let(:email_body){ "Congratulations, you just sent an email with Mailgun!  You are truly awesome!" }

    it 'sengs an email message' do
      response = mailer.send_message(sender, reciever, subject, email_body)
      expect(response.code).to eq(200)
    end
  end
end