class Player
  include Virtus.model

  attribute :uuid, String
  attribute :name, String
  attribute :nick, String

  def create(attributes)
    self.attributes.merge!(attributes)
    self
  end
end
