module JM
  module Game
    module V1
      class GameResource < Roar::Decorator
        include Roar::Representer::JSON::HAL

        link :new do
          "http://localhost:9393/foo"
        end
      end
    end
  end
end
