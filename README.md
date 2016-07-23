# Jsonbrowser

A tool for making sense of large JSON structures while debugging. It sends the JSON to a website and outputs a direct URL where you can browse the JSON structure.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jsonbrowser'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jsonbrowser

## Usage

```ruby
JsonBrowser({ a: { b: [{ x: 13, y: 49}, { x: 45, y: -35 }], c: [3, 4]}})
# "https://json.jkl.me/documents/FFdTSmypfT"
```

You can supply a JSON String, Hash, Array, or any object that responds to one of
`to_json`, `as_json`, `to_hash`, `to_h`, `to_array`, `to_a` or `serializable_hash`.

You can [host the web app yourself](https://github.com/bagilevi/jsonbrowser) and
add this configuration:

```ruby
JsonBrowser.root = 'http://json.local' # no trailing slash
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bagilevi/jsonbrowser-gem.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
