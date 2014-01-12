class JM::Player::CreatePlayerCommand < Imperator::Command
  include Wisper::Publisher

  attribute :name
  attribute :nick

  validates_presence_of :name, :nick

  action do
    self.subscribe(::PlayerRepository)

    if player.create(self.attributes)
      publish(:player_created, player)
    else
      publish(:player_creation_failed, self)
    end
  end

  def player
    @player ||= Player.new(uuid: self.id)
  end
end
