class JM::Player::CreatePlayerCommand < Imperator::Command
  include Wisper::Publisher

  attribute :name
  attribute :nick

  validates_presence_of :name, :nick

  action do
    self.subscribe(::PlayerRepository)
    publish(:player_created, player.attributes) if player.create(self.attributes)
  end

  def player
    @player ||= Player.new(uuid: self.id)
  end
end
