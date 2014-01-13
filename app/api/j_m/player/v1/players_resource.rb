module JM
  module Player
    module V1
      class PlayersResource < Roar::Decorator
        include Roar::Representer::JSON

        collection :players, extend: ::JM::Player::V1::PlayerResource
      end
    end
  end
end
