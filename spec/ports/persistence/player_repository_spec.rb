require_relative '../../spec_helper'

describe PlayerRepository do
  subject{ PlayerRepository }
  let(:player_memory_store) do
    Class.new do
      include Virtus.model

      attribute :name
      attribute :nick
      attribute :uuid
    end
  end

  before{ subject.repository_for(player_memory_store) }

  describe 'we can set a strategy' do
    let(:strategy) { :foo }

    it 'sets a global strategy' do
      subject.strategy = strategy
      subject.strategy.must_equal strategy
    end

    describe 'when the strategy is not an symbol' do
      let(:strategy) { 'foo' }

      it 'raise an ArgumentError' do
        proc{ subject.strategy = strategy }.must_raise ArgumentError
      end
    end
  end

  describe 'we can setup a base document' do
    let(:strategy) { :memory }
    let(:base_document) { Class.new }

    before do
      subject.strategy = strategy
    end

    it 'sets the adaptor to proxy to base_document' do
      subject.stub(:base_document, base_document) do
        subject.adaptor.must_equal base_document
      end
    end
  end

  describe '.player_created(player)' do
    let(:attr) { { uuid: 'foo', name: 'John', nick: 'Doe' } }
    let(:player) { ::Player.new(attr) }

    subject{ PlayerRepository }

    it 'saved documents' do
      doc = subject.player_created(player)

      stored = subject.find(doc.uuid)
      stored.name.must_equal attr[:name]
      stored.nick.must_equal attr[:nick]
    end
  end
end
