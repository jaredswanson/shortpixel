# client.connection.post('reducer.php', {})

require 'active_support/core_ext/hash'
require 'faraday'
require 'faraday_middleware'
require 'json'

module ShortPixel
  class Client
    BASE_URL = 'https://api.shortpixel.com/v2/'

    attr_reader :api_key, :adapter

    def initialize(api_key:, adapter: Faraday.default_adapter, stubs: nil)
      @api_key = api_key
      @adapter = adapter
      @stubs = stubs
    end

    def post_reducer
      PostReducerResource.new(self)
    end

    # pngs = ["https://someurl.com/someimage.png"]
    # reducer = client.reducer.info(lossy: 1, urllist: pngs)
    # result = reducer.results.first
    # result.lossy_url
    # result.lossy_size
    def reducer
      ReducerResource.new(self)
    end

    def connection
      @connection ||= Faraday.new do |conn|
        conn.url_prefix = BASE_URL
        conn.request :json

        conn.response :json, content_type: "application/json"

        conn.adapter adapter, @stubs
      end
    end
  end
end
