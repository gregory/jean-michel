ENV['RACK_ENV'] = 'test'

require File.expand_path('../../config/environment', __FILE__)

require 'minitest/autorun'
require 'minitest/pride'
require 'rack/test'
require 'support/request_helper.rb'


class Minitest::Spec
  include Rack::Test::Methods
  include Support::JsonHelper

  def app
    @_app ||= Rack::Builder.parse_file(File.dirname(__FILE__) + '/../config.ru').first
  end
end
