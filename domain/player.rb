class Player
  include Virtus.model

  attribute :id, String
  attribute :name, String
  attribute :nick, String

  def create(attributes)
    self.attributes = attributes
  end
end
