require 'http_mailer'
require 'webmock/rspec'

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do

    # Stub Mailgun HTTP requests
    stub_request(:post, %r{https://api:key-\w+@api.mailgun.net/v2/\w+.mailgun.org/messages}).
      with(:body => {"from"=>/.*/, "subject"=>/.*/, "text"=>/.*/, "to"=>/.*/},
          :headers => {'Accept'=>'*/*; q=0.5, application/xml', 'Accept-Encoding'=>'gzip, deflate', 'Content-Length'=>'224', 'Content-Type'=>'application/x-www-form-urlencoded', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => "", :headers => {})

    # Stub SendGrid HTTP requests
    stub_request(:post, "https://sendgrid.com/api/mail.send.json").
      with(:body => {"api_key"=>/.*/, "api_user"=>/.*/, "from"=>/.*/, "fromname"=>/.*/, "subject"=>/.*/, "text"=>/.*/, "to"=>/.*/, "toname"=>/.*/},
          :headers => {'Accept'=>'*/*; q=0.5, application/xml', 'Accept-Encoding'=>'gzip, deflate', 'Content-Length'=>'208', 'Content-Type'=>'application/x-www-form-urlencoded', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => "", :headers => {})

  end
end