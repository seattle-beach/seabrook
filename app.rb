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
        "you seek '#{params[:date]}'"
      end

      post do
        "you entered '#{params[:date]}'"
      end
    end
  end
end
