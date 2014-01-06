ENV['RACK_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)

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
