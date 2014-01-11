require_relative '../../spec_helper'

describe PlayerRepository do
  subject{ PlayerRepository }

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

  describe '.player_created(attr)' do
    let(:attr) { { id: 'foo', name: 'John', nick: 'Doe' } }

    subject{ PlayerRepository }

    it 'saved documents' do
      subject.repository_for(PlayerDocument)
      doc = subject.player_created(attr)

      stored = subject.find(doc.id)
      stored.name.must_equal attr[:name]
      stored.nick.must_equal attr[:nick]
    end
  end
end
