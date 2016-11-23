# YARD::Mongoid

[![Gem Version](https://badge.fury.io/rb/yard-mongoid.svg)][gem]
[![Build Status](https://secure.travis-ci.org/alsemyonov/yard-mongoid.svg?branch=master)][travis]
[![Dependency Status](https://gemnasium.com/alsemyonov/yard-mongoid.svg)][gemnasium]
[![Code Climate](https://codeclimate.com/github/alsemyonov/yard-mongoid/badges/gpa.svg)][codeclimate]
[![Test Coverage](https://codeclimate.com/github/alsemyonov/yard-mongoid/badges/coverage.svg)][coverage]

A [YARD](https://rubygems.org/gems/yard) plugin for documenting [Mongoid](https://rubygems.org/gems/mongoid) models. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yard-mongoid'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yard-mongoid

## Usage

Add following line to `.yardopts`:

```
--plugin mongoid
```

or use it as argument to `yard doc` command like `yard doc --plugin mongoid`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bin/rake install`. To release a new version, update the version number in `version.rb`, and then run `bin/rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/alsemyonov/yard-mongoid. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

© [Alex Semyonov](https://al.semyonov.us/) <[alex@semyonov.us](mailto:alex@semyonov.us?subject=yard-mongoid)>, 2016

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

[gem]: https://rubygems.org/gems/yard-mongoid
[travis]: https://travis-ci.org/alsemyonov/yard-mongoid
[gemnasium]: https://gemnasium.com/alsemyonov/yard-mongoid
[codeclimate]: https://codeclimate.com/github/alsemyonov/yard-mongoid
[coverage]: https://codeclimate.com/github/alsemyonov/yard-mongoid/coverage
