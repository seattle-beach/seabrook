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
          topic = Topic.new(content: params[:content])
          Meeting.find(params[:date])
            .topics
            .push(topic)

          topic
        end
      end
    end
  end
end
