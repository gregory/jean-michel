class Player
  include Virtus.model
  include Wisper::Publisher

  attribute :uuid, String
  attribute :name, String
  attribute :nick, String

  #TODO: create and assign new uuid

  def create(attributes)
    player_created(attributes)
    publish(:player_created, attributes)
  end

  def player_created(attributes)
    self.attributes = attributes
  end
end
