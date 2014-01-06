module JM
  class GameApi < Grape::API
    format :json
    default_format :json

    helpers JM::ApplicationHelper

    resource :games do
      desc "Return the list of games"
      get do
        JM::Game::V1::GameResource.new("")
      end
    end
  end
end
