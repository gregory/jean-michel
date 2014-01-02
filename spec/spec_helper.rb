require 'rubygems'
require 'bundler/setup'

Bundler.require(:default, :test)

ENV['RACK_ENV'] = 'test'

Dir.glob('../app/{models,helpers,controllers}/*.rb').each{ |file| require file }
Dir.glob('../lib/*.rb').each{ |file| require file }

require 'minitest/autorun'
require 'minitest/pride'

def app
  Sinatra::Application
end

Capybara.app = eval "Rack::Builder.new {( " + File.read(File.dirname(__FILE__) + '/../config.ru') + "\n )}"

class Minitest::Spec
  include Capybara::DSL

  def teardown
    Capybara.reset_session!
    Capybara.use_default_driver
  end
end
