require 'mongoid'

require_relative 'id_filter'
require_relative 'app'

Mongoid.load!('mongoid.yml')

use IdFilter
run App
