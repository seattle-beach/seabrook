require 'mongoid'

class Meeting
  include Mongoid::Document
  field :date, type: Date
  embeds_many :topics
end
