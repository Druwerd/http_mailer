require 'spec_helper'

describe HttpMailer::MandrillServiceApi do
  
  describe "#send_messages_url" do
    let(:host){ "mandrillapp.com" }
    let(:protocol){ "https" }
    let(:version){ "1.0" }
    let(:service_api){ HttpMailer::MandrillServiceApi.new(host, protocol, version) }

    it 'returns the Mandrill send message endpoint URL' do
      expect(service_api.send_messages_url).to eq("https://mandrillapp.com/api/1.0/messages/send.json")
    end
  end
end