require_relative '../../../spec_helper'

describe JM::Player::CreatePlayerCommand do
  let(:params) { {} }
  subject{ JM::Player::CreatePlayerCommand }

  it{ assert_equal false, subject.new({}).valid? }
  it{ assert_equal false, subject.new({name: ''}).valid? }
  it{ assert_equal false, subject.new({nick: ''}).valid? }
  it{ assert_equal false, subject.new({name: 'foo'}).valid? }
  it{ assert_equal false, subject.new({nick: 'foo'}).valid? }
  it{ assert_equal true, subject.new({name: 'foo', nick: 'foo'}).valid? }

  describe 'create a new player' do
    let(:params) { { name: 'foo', nick: 'bar' } }
    let(:player) { Minitest::Mock.new }

    subject{ JM::Player::CreatePlayerCommand.new(params) }

    before do
      def player.attributes; {}; end
    end

    it 'creates a new player' do
      subject.stub(:player, player) do
        player.expect(:create, "foo", [params.merge({id: subject.id})])
        subject.perform
        player.verify
      end
    end

  end
end
