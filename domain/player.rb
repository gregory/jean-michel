class Player
  include Virtus.model
  include Wisper::Publisher

  attribute :id, String
  attribute :name, String
  attribute :nick, String

  def create(attributes)
    player_created(attributes)
    publish(:player_created, self.attributes)
  end

private

  def player_created(attributes)
    self.attributes = attributes
  end
end
