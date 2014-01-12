require_relative '../spec_helper'

describe Player do
  describe 'create a new Player' do
    let(:fname) { Faker::Name.name }
    let(:nick) { Faker::Name.name }
    let(:uuid) { SecureRandom.hex(24) }

    subject{ Player.new(uuid: uuid, name: fname, nick: nick) }

    it { subject.name.must_equal fname }
    it { subject.nick.must_equal nick }
    it { subject.uuid.must_equal uuid }
  end
end
