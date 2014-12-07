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

Mailgun

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

Mandrill

```ruby
mandrill_client = HttpMailer.mandrill({
  host: "mandrillapp.com",
  api_key: "XXXXXXXXX"
})

from = "papa@prose.com"
from_name = "Ernest Hemingway"
to = "jd@catcher.com"
to_name = "JD Salinger"
subject = "Hello"
text = "Every man's life ends the same way. \
It is only the details of how he lived and \
how he died that distinguish one man from another."

mandrill_client.send_message(from, to, subject, text, to_name, from_name)
```

SendGrid

```ruby
sendgrid_client = HttpMailer.sendgrid({
  host: "sendgrid.com",
  api_user: "username",
  api_key: "XXXXXXXXX"
})

from = "jcash@tennesseethree.com"
from_name = "Johnny Cash"
to = "elvis@graceland.com"
to_name = "Elvis Presley"
subject = "Hello"
text = "Success is having to worry about every damn thing in the world, except money."

sendgrid_client.send_message(from, to, subject, text, to_name, from_name)
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/http_mailer/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
