require 'mongoid'
require 'rack/cors'

require_relative 'id_filter'
require_relative 'app'

Mongoid.load!('mongoid.yml')


use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [:get, :post]
  end
end

use IdFilter
run App
