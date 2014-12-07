# HttpMailer

Send emails via Mailgun, Mandrill and SendGrid HTTP APIs.

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

```ruby
mailgun_client = HttpMailer.mailgun({
  host: "api.mailgun.net",
  api_key: "XXXXXXXXX",
  subdomain: "samples.mailgun.net"
})

from = "Excited User <me@samples.mailgun.org>"
to = "baz@example.com"
subject = "Hello"
text = "Testing some Mailgun awesomness!"

mailgun_client.send_message(from, to, subject, text)
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/http_mailer/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
