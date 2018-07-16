require 'mongo_mapper'

class Meeting
  include MongoMapper::Document

  key :date, Date
  many :topics
end
