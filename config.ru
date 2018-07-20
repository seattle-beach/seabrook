require 'mongoid'

require_relative 'app'

Mongoid.load!('mongoid.yml')

run App
