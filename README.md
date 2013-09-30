# YtMeta

This gem takes a Youtube URL or ID and optional data attributes and returns a
hash of metadata about the video.

## Installation

Add this line to your application's Gemfile:

    gem 'yt_meta'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yt_meta

## Usage

Google requires an API key to use the Youtube API. Follow these instructions to
create an app: [Generate Key](https://developers.google.com/youtube/registering_an_application).
Use the server key Google generates for you as your API key. Then create an
initializer with your API key and an optional default parts array so you don't
have to specify the parts you want every time.

```ruby
YtMeta.configure do |config|
  config.api_key = "API_KEY"
  config.parts = %w[snippet player] #optional
end
```

To retrieve all public data about a video (or your default parts),
`require "yt_meta"` and then call `YtMeta.fetch_data(youtube_id: "some_id")`.

If you wish to fetch only specific parts, call
`YtMeta.fetch_data(youtube_id: "some_id", parts: ["snippet", "player"])`,
replacing the parts in the array with the ones you want.

You can find a full list of available parts here:
[API Docs](https://developers.google.com/youtube/v3/docs/videos/list).
Be aware that `fileDetails`, `processingDetails`, and `suggestions` require
client OAuth2 login and won't work with this gem.

## Contributing

1. Fork!
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Add a configuration file with your API key at `spec/support/api_config.rb`.
   It's `.gitignore`d, so your credentials won't be saved to the repo.

    ```ruby
    YtMeta.configure do |config|
      config.api_key = "TEST_API_KEY"
    end
    ```

4. Make your changes!
5. Make sure all tests pass! If you get SSL certificate verification errors
   when running the specs, try
   [these fixes](http://railsapps.github.io/openssl-certificate-verify-failed.html)
6. Commit your changes (`git commit -am 'Add some feature'`)
7. Push to the branch (`git push origin my-new-feature`)
8. Create new Pull Request
