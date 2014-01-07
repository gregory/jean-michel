require_relative '../../spec_helper'

describe 'Player Api' do
  describe "/players" do
    it 'returns a link to the game collection' do
      get '/players'
      last_response.ok?.must_equal true
      json["_links"]["players"]["href"].must_equal "http://localhost:9393/foo"
    end
  end
end
