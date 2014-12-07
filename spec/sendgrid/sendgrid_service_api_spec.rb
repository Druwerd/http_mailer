require 'spec_helper'

describe HttpMailer::SendGridServiceApi do
  
  describe "#send_messages_url" do
    let(:host){ "api.sendgrid.com" }
    let(:protocol){ "https" }
    let(:service_api){ HttpMailer::SendGridServiceApi.new(host, protocol) }

    it 'returns the SendGrid send message endpoint URL' do
      expect(service_api.send_messages_url).to eq("https://api.sendgrid.com/api/mail.send.json")
    end
  end
end