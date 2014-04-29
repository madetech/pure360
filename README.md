# Pure360

[![Build Status](https://travis-ci.org/madebymade/pure360.svg?branch=master)](https://travis-ci.org/madebymade/pure360)
[![GitHub version](https://badge.fury.io/gh/madebymade%2Fpure360.svg)](http://badge.fury.io/gh/madebymade%2Fpure360)

A wrapper for posting data to the Pure360 email marketing platform.

## Installation

Add this line to your application's Gemfile:

    gem 'pure360'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pure360

## Usage

Instantiate a new Pure360 object.

```ruby
params = {
  endpoint: 'https://custom-pure360-url/interface/list.php',
  account:  'YourAccount',
  list:     'ActiveData_2014-04-14' }

p360 = Pure360::Client.new(params)
```

Some optional parameters can be passed in:
```ruby
  full_email_validation: true
  double_optin:          true
```

These will default to false if not specified.

Once the object has been instantiated, you can use the subscribe method.

You can specify as many parameters as you need in the form of a hash as the argument to the subscribe method.
The 'email' hash entry however is required.

```ruby
p360.subscribe({ email: "test@test.com" })
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
