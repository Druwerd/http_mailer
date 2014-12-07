require 'spec_helper'

describe HttpMailer::MandrillMessage do
  
  describe "#initialize" do
    let(:from){ "from@test.com"}
    let(:from_name){ "Test Sender"}
    let(:to){ "to@test.com" }
    let(:to_name){ "Test Reciever"}
    let(:subject){ "Hello" }
    let(:text_body){ "Congratulations, you just sent an email with Mandrill!  You are truly awesome!" }
    let(:html_body){ "<h1>Congratulations, you just sent an email with Mandrill!  You are truly awesome!</h1>"}
    let(:message){ HttpMailer::MandrillMessage.new(to, from, subject, text_body, html_body, to_name, from_name) }

    it 'builds a propery formated Mandrill message' do
      expect(message.to_h[:to]).to eq [{:email => to, :name => to_name}]
      expect(message.to_h[:from_email]).to eq from
      expect(message.to_h[:from_name]).to eq from_name
      expect(message.to_h[:subject]).to eq subject
      expect(message.to_h[:text]).to eq text_body
      expect(message.to_h[:html]).to eq html_body
    end
  end
end