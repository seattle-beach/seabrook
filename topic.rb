require 'mongoid'

class Topic
  include Mongoid::Document
  field :content, type: String
  field :votes, type: Integer, default: 0
  embedded_in :meeting

  field :_id, type: Integer
  #
  # actually creates another field on the document, but works fine otherwise
  field :id, default: -> { _id }
end
