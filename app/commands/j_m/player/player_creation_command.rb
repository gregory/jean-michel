class JM::Player::PlayerCreationCommand < Imperator::Command
  include Wisper::Publisher

  attribute :name
  attribute :nick

  validates_presence_of :name, :nick

  action do
    if valid?
      player.on(:player_created) { publish(:player_creation_succeed, player) }
      player.create(self.attributes)
    else
      publish(:player_creation_failed, self)
    end
  end

  def player
    @_player ||= Player.new.tap {|p| p.subscribe(::PlayerRepository) }
  end
end
