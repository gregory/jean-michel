module JM
  module Player
    module V1
      class PlayerResource < Roar::Decorator
        include Roar::Representer::JSON::HAL

        link :players do
          "http://localhost:9393/foo"
        end
      end
    end
  end
end
