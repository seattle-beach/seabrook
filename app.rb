require 'grape'

require_relative 'meeting'
require_relative 'topic'

class App < Grape::API
  format :json

  resource :meetings do
    get do
      Meeting.all
    end

    route_param :date, type: Date do
      get do
        Meeting.find(params[:date])
      end

      post do
        Meeting.new(date: params[:date], title: params[:title]).upsert
        return
      end

      resource :topics do
        get do
          Meeting.find(params[:date]).topics
        end

        post do
          meeting = Meeting.find(params[:date])
          topic = Topic.new(content: params[:content], id: meeting.topics.count)
          meeting.topics.push(topic)

          return
        end

        route_param :id, type: Integer do
          get do
            Meeting.find(params[:date]).topics[params[:id]]
          end

          post do
            topic = Meeting.find(params[:date]).topics[params[:id]]
            topic.votes += 1
            topic.save

            return
          end
        end
      end
    end
  end
end
