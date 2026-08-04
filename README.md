# htmd

Convert a markdown file to HTML and open it in your default browser. Rendering is done with [Commonmarker](https://github.com/gjtorikian/commonmarker), the HTML is written to a tempfile, and the tempfile is opened with the macOS `open` command.

Requires macOS and Ruby 3.4+.

## Installation

```bash
gem install htmd
```

## Usage

Pass a markdown file:

```bash
htmd README.md
```

Or pipe markdown on stdin:

```bash
echo "# Hello" | htmd
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/nihil2501/htmd.

## License

The gem is available as open source under the terms of the
[MIT License](https://opensource.org/licenses/MIT).
