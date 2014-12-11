require 'spec_helper'

describe HttpMailer::Client do

  context "when configured" do
    let(:settings){ {:mailgun => {:host => "api.mailgun.net", :api_key => "key-12345", :subdomain => "sandbox12345.mailgun.org"},
                    :sendgrid => {:host => "sendgrid.com", :api_user=> "test", :api_key => "1234"},
                    :mandrill => {:host => "mandrillapp.com", :api_key => "1234567890"}} }

    describe "#initialize" do
      it "creates a client instance" do
        expect(HttpMailer::Client.new(settings)).to be_a HttpMailer::Client
      end
    end

    describe '#send_message' do
      let(:settings){ {:mailgun => {:host => "api.mailgun.net", :api_key => "key-12345", :subdomain => "sandbox12345.mailgun.org"},
                    :sendgrid => {:host => "sendgrid.com", :api_user=> "test", :api_key => "1234"},
                    :mandrill => {:host => "mandrillapp.com", :api_key => "1234567890"}} }
      let(:mailer_client){ HttpMailer::Client.new(settings) }

      let(:sender){ "sender@test.com"}
      let(:reciever){ "reciever@test.com>" }
      let(:subject){ "Hello" }
      let(:email_body){ "Congratulations, you just sent an email with HttpMailer!  You are truly awesome!" }

      it 'sends an email' do
        response = mailer_client.send_message(sender, reciever, subject, email_body)
        expect(response.code).to eq(200)
      end
    end
  end

end