## Responsibly extends Ruby's Hash with simple and predictable utilities.

[![Gem Version](https://badge.fury.io/rb/hash-tweaks.svg)](https://badge.fury.io/rb/hash-tweaks)
[![Build Status](https://travis-ci.org/yivo/hash-tweaks.svg?branch=master)](https://travis-ci.org/yivo/hash-tweaks)

## Current features
* `camelize`
* `camelize!`

## Installing gem
Add to your Gemfile:
```ruby
gem 'hash-tweaks', '~> 1.0'
```

If you are using Ruby < 2.4 please add:
```ruby
gem 'regexp-match-polyfill', '~> 1.0'
```

## Running tests
Install bundler:
```bash
gem install bundler
```

Install dependencies:
```bash
cd hash-tweaks && bundle
```

Run tests:
```bash
cd hash-tweaks && bundle exec rake test
```
