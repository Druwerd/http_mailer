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
end