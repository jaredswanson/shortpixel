# ShortPixel

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/shortpixel`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'shortpixel'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install shortpixel

## Usage
### Reducer
The ShortPixel Reducer API expects an array of publically available urls for your images. (If you need to upload the urls from the local machine to ShortPixel use the PostReducer API.)

```ruby
pngs = ['https://fakeurl.com/first_image.png', 'https://fakeurl.com/second_image.png']

client = ShortPixel::Client.new(api_key: <<SHORTPIXEL_API_KEY>>)

reducer = client.reducer
initial_request = reducer.call(lossy: 1, urllist: pngs)

# Wait for images to process

follow_up_request = reducer.recall

# Or repeat the original request

alternate_follow_up = reducer.call((lossy: 1, urllist: pngs)
```

For a list of parameters to use with the Reducer API, check out ShortPixel's [official API docs](https://shortpixel.com/api-docs).

For example, you could modify "initial_request" above like this:

```ruby
initial_request = reducer.call(lossy: 1, urllist: pngs, wait: 5, convertto: '+webp')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jaredswanson/shortpixel. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/jaredswanson/shortpixel/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ShortPixel project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/jaredswanson/shortpixel/blob/master/CODE_OF_CONDUCT.md).
