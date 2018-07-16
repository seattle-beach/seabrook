require 'grape'

class App < Grape::API
  format :json

  resource :meetings do
    get do
      {:data => [1, 2, 3]}
    end
  end
end
