require 'mongo_mapper'

class Topic
  include MongoMapper::EmbeddedDocument

  key :content, String
  key :votes, Integer
end
