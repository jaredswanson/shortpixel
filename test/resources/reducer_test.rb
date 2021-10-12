require 'test_helper'
require 'faraday'
require 'pry'

class ReducerResourceTest < Minitest::Test
  def test_call
    png = "https://fakeurl.com/fake-image.png"
    pngs = [png]
    body = { lossy: 1, urllist: pngs }
    api_key = 'fake_key'
    request_body = body.merge(key: api_key).to_json

    stub = Faraday::Adapter::Test::Stubs.new do |stub|
      stub.post('https://api.shortpixel.com/v2/reducer.php', request_body) do |env|
        [200, {"Content-Type" => "application/json"}, File.read('test/fixtures/reducer/call.json').to_json]
      end
    end

    client = ShortPixel::Client.new(api_key: api_key, adapter: :test, stubs: stub)

    reducer = client.reducer
    queue = reducer.call(**body)

    assert_equal ShortPixel::Reducer, queue.class
    results = queue.results
    assert_kind_of Array, results
    first_result = queue.results.first
    assert_kind_of OpenStruct, first_result
    assert_kind_of String, first_result.original_url
    status = first_result.status
    assert_kind_of OpenStruct, status
    assert_kind_of String, status.code
    assert_kind_of String, status.message

  end
end
