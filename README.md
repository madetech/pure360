# Pure360

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'pure360'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pure360

## Usage

Instantiate a new Pure360 object.

p360 = Pure360.new(:endpoint => 'https://my-website.com/interface/list.php',
  :account => 'YourAccount',
  :list => 'ActiveData_2014-04-14',
  :full_email_validation => false,
  :double_optin => false)

  Endpoint: Your 3

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
