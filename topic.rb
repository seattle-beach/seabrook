require 'mongoid'

class Topic
  include Mongoid::Document
  field :content, type: String
  field :votes, type: Integer
end
