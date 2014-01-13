require_relative '../../spec_helper'

describe 'Player Api' do
  describe "GEt /players" do
    it 'returns a link to the game collection' do
      get '/players'
      last_response.ok?.must_equal true
      json["players"].class.must_equal Array
    end
  end

  describe 'POST /players' do
    let(:nick) { 'foo' }
    let(:n) { 'barista' }

    it 'returns an error if name is missing' do
      post '/players', {nick: nick}
      last_response.must_be :bad_request?
      json['error'].must_equal "name is missing"
    end

    it 'returns an error if nick is missing' do
      post '/players', {name: n}
      last_response.must_be :bad_request?
      json['error'].must_equal "nick is missing"
    end

    it 'returns an error if nick is missing' do
      post '/players', {name: '', nick: ''}
      last_response.must_be :bad_request?
      json['nick'].must_equal ["can't be blank"]
      json['name'].must_equal ["can't be blank"]
    end

    it 'creates a player' do
      post '/players', {name: n, nick: nick}
      last_response.must_be :successful?
      json['name'].must_equal n
      json['nick'].must_equal nick
      json['uuid'].wont_be :nil?
      json['_links']['players']['href'].must_equal 'http://localhost:9393/players'
    end
  end
end
