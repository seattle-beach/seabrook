require 'mongoid'

class Meeting
  include Mongoid::Document
  field :date, type: Date
  field :title, type: String
  embeds_many :topics

  field :_id, type: Date, default: ->{ date }

  after_initialize do
    self[:topics] ||= []
  end
end
