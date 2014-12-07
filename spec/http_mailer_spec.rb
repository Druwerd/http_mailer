require 'spec_helper'

describe HttpMailer do

  context "when configured for Mailgun" do
    let(:settings){ {:host => "api.mailgun.net", :api_key => "12345", :subdomain => "sandbox12345.mailgun.org"} }

    describe ".mailgun" do
      it "creates a service handler for Mailgun" do
        expect(HttpMailer.mailgun(settings)).to be_a HttpMailer::MailgunServiceHandler
      end
    end
  end

  context "when configured for SendGrid" do
    let(:settings){ {:host => "sendgrid.com", :api_user=> "test", :api_key => "1234"} }

    describe ".sendgrid" do
      it "creates a service handler for SendGrid" do
        expect(HttpMailer.sendgrid(settings)).to be_a HttpMailer::SendGridServiceHandler
      end
    end

  end

  context "when configured for Mandrill" do
    let(:settings){ {:host => "mandrillapp.com", :api_key => "1234567890"} }

    describe ".mandrill" do
      it "creates a service handler for Mandrill" do
        expect(HttpMailer.mandrill(settings)).to be_a HttpMailer::MandrillServiceHandler
      end
    end
  end

end