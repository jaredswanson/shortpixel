$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require 'short_pixel'
require "minitest/autorun"
require "faraday"
require "json"
require 'pry'

class Minitest::Test
  def stub_response(fixture:, status: 200, headers: {"Content-Type" => "application/json"})
    [status, headers, File.read("test/fixtures/#{fixture}.json")]
  end

  def stub_request(path, response:, method: :get, body: {})
    Faraday::Adapter::Test::Stubs.new do |stub|
      # arguments = [method, "/v2/#{path}"]
      arguments = [method, "/#{path}"]
      # arguments = [method, "https://api.shortpixel.com/v2/reducer.php"]
      # arguments << body.to_json if [:post, :put, :patch].include?(method)
      arguments << body if [:post, :put, :patch].include?(method)
      stub.send(*arguments) { |env| response }
    end
  end
end
