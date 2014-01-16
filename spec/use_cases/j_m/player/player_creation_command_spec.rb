require_relative '../../../spec_helper'

describe JM::Player::PlayerCreationCommand do
  let(:params) { {} }
  subject{ JM::Player::PlayerCreationCommand }

  it{ assert_equal false, subject.new({}).valid? }
  it{ assert_equal false, subject.new({name: ''}).valid? }
  it{ assert_equal false, subject.new({nick: ''}).valid? }
  it{ assert_equal false, subject.new({name: 'foo'}).valid? }
  it{ assert_equal false, subject.new({nick: 'foo'}).valid? }
  it{ assert_equal true, subject.new({name: 'foo', nick: 'foo'}).valid? }

  before do
    PlayerRepository.strategy = :mongo
    PlayerRepository.repository_for(PlayerDocument)
  end

  describe 'create a new player' do
    subject{ JM::Player::PlayerCreationCommand.new(params) }

    describe 'when the command is valid' do
      let(:params) { { name: 'foo', nick: 'bar' } }

      let(:listener) { Minitest::Mock.new }
      let(:command_listener) { Minitest::Mock.new }

      before do
        subject.subscribe(command_listener)
        subject.player.subscribe(listener)
      end

      it 'receive a publication from the player' do
        command_listener.expect(:player_creation_succeed, nil, [subject.player])
        listener.expect(:player_created, nil, [params.merge({id: subject.id})])
        subject.perform
        listener.verify
        command_listener.verify
      end

      it 'create and persist a new player' do
        player = subject.player
        subject.perform
        p = PlayerRepository.find(player.id)
        p.class.must_equal PlayerDocument
        p.uuid.must_equal player.id
        p.nick.must_equal player.nick
        p.name.must_equal player.name
      end
    end

    describe 'when the command is invalid' do
      let(:params) { { name: '', nick: 'bar' } }
      let(:listener) { Minitest::Mock.new }

      before{ subject.subscribe(listener) }

      it 'publish: player_creation_failed' do
        listener.expect(:player_creation_failed, nil, [subject])
        subject.perform
        listener.verify
      end
    end
  end
end
