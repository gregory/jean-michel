require_relative '../../spec_helper'

describe 'Game Api' do
  describe "/games" do
    it 'returns a link to create a new game' do
      get '/games.json'
      last_response.ok?.must_equal true
      json["_links"]["new"]["href"].must_equal "http://localhost:9393/foo"
    end
  end
end
