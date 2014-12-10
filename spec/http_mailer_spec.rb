require 'spec_helper'

describe HttpMailer do

  context "when configured" do
    let(:settings){ {:mailgun => {:host => "api.mailgun.net", :api_key => "12345", :subdomain => "sandbox12345.mailgun.org"},
                    :sendgrid => {:host => "sendgrid.com", :api_user=> "test", :api_key => "1234"},
                    :mandrill => {:host => "mandrillapp.com", :api_key => "1234567890"}} }

    describe ".client" do
      it "creates a client instance" do
        expect(HttpMailer.client(settings)).to be_a HttpMailer::Client
      end
    end
  end

end