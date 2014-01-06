module JM
  class GameApi < Grape::API
    format :json
    get '/games' do
      { games: [] }
    end
  end
end
