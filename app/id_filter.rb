require 'json'

class IdFilter
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)
    if !headers['Content-Type'].nil? and
      headers['Content-Type'].include?('application/json') and
      response.body.first != 'null' then
      body = JSON.parse(response.body.first)
      traverse!(body)
      filtered = body.to_json
      headers['Content-Length'] = filtered.length.to_s
      response = [filtered]
    end

    [status, headers, response]
  end

  def traverse!(object)
    if object.is_a?(Array)
      object.map!(&method(:traverse!))
    elsif object.is_a?(Hash)
      remove_id!(object)
      object.values.map!(&method(:traverse!))
    end

    object
  end

  def remove_id!(hash)
    hash.delete('_id')
  end

end
