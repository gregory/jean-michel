require_relative '../spec_helper'

describe Player do
  let(:fname) { Faker::Name.name }
  let(:nick) { Faker::Name.name }
  let(:id) { SecureRandom.hex(24) }

  describe '.new' do
    subject{ Player.new(id: id, name: fname, nick: nick) }

    it { subject.name.must_equal fname }
    it { subject.nick.must_equal nick }
    it { subject.id.must_equal id }
  end

  describe '.create(attributes)' do
    let(:attributes) { { name: fname, nick: nick, id: id } }
    let(:player) { Player.new }
    let(:listener) { Minitest::Mock.new }

    subject{ player.create(attributes) }

    before{ player.subscribe(listener) }

    it 'creates a new player' do
      listener.expect(:player_created, attributes, [attributes])
      subject
      listener.verify
    end
  end
end
