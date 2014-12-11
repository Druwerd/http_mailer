require 'spec_helper'

describe HttpMailer::MailgunServiceApi do
  
  describe "#send_messages_url" do
    let(:host){ "api.mailgun.net" }
    let(:api_key){ "key-1234567890" }
    let(:subdomain){ "sandbox1234567890.mailgun.org" }
    let(:protocol){ "https" }
    let(:version){ "v2" }
    let(:service_api){ HttpMailer::MailgunServiceApi.new(host, api_key, subdomain, protocol, version) }

    it 'returns the Mailgun send message endpoint URL' do
      expect(service_api.send_messages_url).to eq("https://api:key-1234567890@api.mailgun.net/v2/sandbox1234567890.mailgun.org/messages")
    end
  end
end