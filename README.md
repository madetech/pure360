# Pure360

[![Build Status](https://travis-ci.org/madebymade/pure360.svg?branch=master)](https://travis-ci.org/madebymade/pure360)
[![GitHub version](https://badge.fury.io/gh/madebymade%2Fpure360.svg)](http://badge.fury.io/gh/madebymade%2Fpure360)

Subscribe to Pure360 email lists.  Specify an endpoint, and data to be posted to it.

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

Some optional parameters can be passed in:
      full_email_validation: true
      double_optin:          true

These will default to false if not specified.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
