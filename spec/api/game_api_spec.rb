require_relative '../spec_helper'

describe 'Game Api' do
  it 'returns a collection of games' do
    get '/games'
    last_response.ok?.must_equal true
    json['games'].must_equal []
  end
end
