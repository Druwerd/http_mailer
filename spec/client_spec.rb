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

      context 'sendgrid is down' do
        let(:sendgrid_down_settings){ {:mailgun => {:host => "api.mailgun.net", :api_key => "key-12345", :subdomain => "sandbox12345.mailgun.org"},
                    :sendgrid => {:host => "sendgriddown.com", :api_user=> "test", :api_key => "1234"},
                    :mandrill => {:host => "mandrillapp.com", :api_key => "1234567890"}} }
        let(:mailer_client_sendgrid_down){ HttpMailer::Client.new(sendgrid_down_settings) }

        it 'sends an email' do
          response = mailer_client_sendgrid_down.send_message(sender, reciever, subject, email_body)
          expect(response.code).to eq(200)
        end
      end

      context 'sendgrid and mailgun is down' do
        let(:sendgrid_and_mailgun_down_settings){ {:mailgun => {:host => "api.mailgundown.net", :api_key => "key-12345", :subdomain => "sandbox12345.mailgun.org"},
                    :sendgrid => {:host => "sendgriddown.com", :api_user=> "test", :api_key => "1234"},
                    :mandrill => {:host => "mandrillapp.com", :api_key => "1234567890"}} }
        let(:mailer_client_sendgrid_and_mailgun_down){ HttpMailer::Client.new(sendgrid_and_mailgun_down_settings) }

        it 'sends an email' do
          response = mailer_client_sendgrid_and_mailgun_down.send_message(sender, reciever, subject, email_body)
          expect(response.code).to eq(200)
        end
      end

      context 'all services are down' do
        let(:all_down_settings){ {:mailgun => {:host => "api.mailgundown.net", :api_key => "key-12345", :subdomain => "sandbox12345.mailgun.org"},
                    :sendgrid => {:host => "sendgriddown.com", :api_user=> "test", :api_key => "1234"},
                    :mandrill => {:host => "mandrillappdown.com", :api_key => "1234567890"}} }
        let(:mailer_client_all_down){ HttpMailer::Client.new(all_down_settings) }

        it 'raises an exception' do
          expect { mailer_client_all_down.send_message(sender, reciever, subject, email_body) }.to raise_exception(HttpMailer::EmailDeliveryError)
          
        end
      end
    end
  end

end