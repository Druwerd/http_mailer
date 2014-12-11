# HttpMailer

Sends emails via SendGrid, Mailgun, or Mandrill HTTP APIs.
HttpMailer attempts to send an email once with each service 
until an attempt is completed successfully.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'http_mailer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install http_mailer

## Usage

Mailgun

```ruby
settings = {
  sendgrid: {
    host: "sendgrid.com",
    api_user: "username",
    api_key: "XXXXXXXXX"
  },
  mailgun: {
    host: "api.mailgun.net",
    api_key: "XXXXXXXXX",
    subdomain: "samples.mailgun.net"
  },
  mandrill: {
    host: "mandrillapp.com",
    api_key: "XXXXXXXXX"
  }
}

http_mailer_client = HttpMailer.client(settings)

from = "papa@prose.com"
from_name = "Ernest Hemingway"
to = "jd@catcher.com"
to_name = "JD Salinger"
subject = "Hello"
text = "Every man's life ends the same way. \
It is only the details of how he lived and \
how he died that distinguish one man from another."

http_mailer_client.send_message(from, to, subject, text, to_name, from_name)
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/http_mailer/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
