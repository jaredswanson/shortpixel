require 'test_helper'
require 'faraday'
require 'pry'

class ReducerResourceTest < Minitest::Test
  def test_call
    png = "https://fakeurl.com/fake-image.png"
    pngs = [png]
    body = { lossy: 1, urllist: pngs }
    api_key = 'fake_key'
    request_body = body.merge(key: api_key)

    # response = stub_response(fixture: 'reducer/results')
    response = stub_response(fixture: 'reducer/call')
    # stub = stub_request('reducer.php', method: :post, body: body, response: response)
    # stub = stub_request('reducer.php', response: response, method: :post, body: body)
    stub = stub_request('reducer.php', response: response, method: :post, body: request_body)

    # client = ShortPixel::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    binding.pry
    client = ShortPixel::Client.new(api_key: api_key, adapter: :test, stubs: stub)

    binding.pry
    reducer = client.reducer
    # queue = reducer.call(lossy: 1, urllist: pngs)
    queue = reducer.call(**body)

    assert_equal ShortPixel::Reducer, queue.class
  end
end
