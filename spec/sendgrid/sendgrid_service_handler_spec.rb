require 'spec_helper'

describe HttpMailer::SendGridServiceHandler do
  
  describe "#send_message" do
    let(:settings){ {:host => "sendgrid.com", :api_user=> "test", :api_key => "1234"} }
    let(:mailer){ HttpMailer::SendGridServiceHandler.new(settings) }
    let(:sender){ "test@test.com"}
    let(:reciever){ "test@test.com" }
    let(:subject){ "Hello" }
    let(:email_body){ "Congratulations, you just sent an email with SendGrid!  You are truly awesome!" }

    it 'sends an email message' do
      response = mailer.send_message(sender, reciever, subject, email_body)
      expect(response.code).to eq(200)
    end
  end
end