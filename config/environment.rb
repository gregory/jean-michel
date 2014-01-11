ENV['RACK_ENV'] ||= 'test'

require File.expand_path('../application', __FILE__)

if ENV['RACK_ENV'] == 'test'
  PlayerRepository.strategy = :memory
end
