class JM::Player::CreatePlayerCommand < Imperator::Command
  include Wisper::Publisher

  attribute :name
  attribute :nick

  validates_presence_of :name, :nick

  action do
    if valid?
      params = self.attributes
      id = params.delete(:id)
      player.on(:player_created) { publish(:player_creation_succeed, player) }
      player.create(params.merge!(uuid: id))
    else
      publish(:player_creation_failed, self)
    end
  end

  def player
    @player ||= Player.new(uuid: self.id).tap {|p| p.subscribe(::PlayerRepository) }
  end
end
