require 'ostruct'
module JM
  class PlayerApi < API
    #version 'v1', vendor: 'jm'
    format :json
    default_format :json

    helpers JM::ApplicationHelper

    resource :players do

      desc "Return the list of players"
      get do
        ::JM::Player::V1::PlayersResource.new OpenStruct.new(players: PlayerRepository.all.to_a)
      end

      desc "Create a new plyer"
      params do
        requires :name, type: String, desc: "The player's name"
        requires :nick, type: String, desc: "A nickname for the player"
      end
      post do
        command = ::JM::Player::CreatePlayerCommand.new(params)
        command.on(:player_created) {|player| return JM::Player::V1::PlayerResource.new(player) }
        command.on(:player_creation_failed) { |cmd| return error!(cmd.errors.messages, 400) }

        command.perform
      end
    end
  end
end
