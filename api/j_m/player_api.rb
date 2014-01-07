module JM
  class PlayerApi < Grape::API
    format :json
    default_format :json

    helpers JM::ApplicationHelper

    resource :players do
      desc "Return the list of players"
      get do
        JM::Player::V1::PlayerResource.new("")
      end
    end
  end
end
