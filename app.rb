require 'grape'

class App < Grape::API
  format :json

  resource :meetings do
    get do
      {:data => [1, 2, 3]}
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
