module JM
  module Player
    module V1
      class PlayerResource < Roar::Decorator
        include Roar::Representer::JSON::HAL

        property :uuid
        property :name
        property :nick

        link :players do
          "http://localhost:9393/players"
        end
      end
    end
  end
end
