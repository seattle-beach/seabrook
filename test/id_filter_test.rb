require 'minitest/autorun'
require 'json'

require_relative '../app/id_filter'

class IdFilterTest < Minitest::Test
  class MockApp
    class MockResponse
      attr_accessor :body
    end

    def initialize(object, headers = {'Content-Type' => 'application/json'})
      @response = MockResponse.new
      @response.body = [object.to_json]

      @headers = headers
    end

    def call(env)
      [200, @headers, @response]
    end
  end

  def test_empty
    subject = IdFilter.new(MockApp.new(nil))

    _, _, response = subject.call(nil)
    assert_equal ['null'], response.body
  end

  def test_object
    object = { '_id' => 123, 'key' => 'value' }
    subject = IdFilter.new(MockApp.new(object))

    _, _, response = subject.call(nil)
    assert_equal({'key' => 'value'}.to_json, response.first)
  end

  def test_nested_object
    object = { '_id' => 123, 'key' => 'value', 'inner' => { '_id' => 234, 'key' => 'value' }}
    subject = IdFilter.new(MockApp.new(object))

    _, _, response = subject.call(nil)

    expected = { 'key' => 'value', 'inner' => { 'key' => 'value' }}
    assert_equal(expected.to_json, response.first)
  end

  def test_array
    object = [{ '_id' => 123, 'key' => 'value', 'inner' => { '_id' => 234, 'key' => 'value' }}]
    subject = IdFilter.new(MockApp.new(object))

    _, _, response = subject.call(nil)

    expected = [{ 'key' => 'value', 'inner' => { 'key' => 'value' }}]
    assert_equal(expected.to_json, response.first)
  end
end
