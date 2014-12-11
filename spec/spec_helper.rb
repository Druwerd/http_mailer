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

    stub_request(:post, "https://sendgrid.com/api/mail.send.json").
         with(:body => {"api_key"=>"1234", "api_user"=>"test", "from"=>"sender@test.com", "fromname"=>"", "subject"=>"Hello", "text"=>"Congratulations, you just sent an email with HttpMailer!  You are truly awesome!", "to"=>"reciever@test.com>", "toname"=>""},
              :headers => {'Accept'=>'*/*; q=0.5, application/xml', 'Accept-Encoding'=>'gzip, deflate', 'Content-Length'=>'219', 'Content-Type'=>'application/x-www-form-urlencoded', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => "", :headers => {})

    # Stub Mandrill HTTP requests
    stub_request(:post, "https://mandrillapp.com/api/1.0/messages/send.json").
       with(:body => "{\"key\":\"1234567890\",\"message\":{\"html\":null,\"text\":\"Congratulations, you just sent an email with Mandrill!  You are truly awesome!\",\"subject\":\"Hello\",\"from_email\":\"papa@prose.com\",\"from_name\":\"Ernest Hemingway\",\"to\":[{\"email\":\"jd@catcher.com\",\"name\":\"JD Salinger\"}],\"headers\":{},\"important\":null,\"track_opens\":null,\"track_clicks\":null,\"auto_text\":null,\"auto_html\":null,\"inline_css\":null,\"url_strip_qs\":null,\"preserve_recipients\":null,\"view_content_link\":null,\"bcc_address\":null,\"tracking_domain\":null,\"signing_domain\":null,\"return_path_domain\":null,\"merge\":null,\"merge_language\":null,\"global_merge_vars\":[],\"merge_vars\":[],\"tags\":[],\"subaccount\":null,\"google_analytics_domains\":[],\"google_analytics_campaign\":null,\"metadata\":[],\"recipient_metadata\":[],\"attachments\":[],\"images\":[]}}",
            :headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip, deflate', 'Content-Length'=>'781', 'Content-Type'=>'application/json', 'User-Agent'=>'Ruby'}).
       to_return(:status => 200, :body => "", :headers => {})

  end
end