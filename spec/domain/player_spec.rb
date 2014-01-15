require_relative '../spec_helper'

describe Player do
  describe '.new' do
    let(:fname) { Faker::Name.name }
    let(:nick) { Faker::Name.name }
    let(:uuid) { SecureRandom.hex(24) }

    subject{ Player.new(uuid: uuid, name: fname, nick: nick) }

    it { subject.name.must_equal fname }
    it { subject.nick.must_equal nick }
    it { subject.uuid.must_equal uuid }
  end

  describe '.create(attributes)' do
    let(:fname) { Faker::Name.name }
    let(:nick) { Faker::Name.name }
    let(:uuid) { SecureRandom.hex(24) }
    let(:attributes) { { fname: fname, nick: nick, uuid: uuid } }
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
