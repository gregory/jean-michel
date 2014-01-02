require 'rubygems'
require 'bundler/setup'

Bundler.require(:default, :assets, ENV['RACK_ENV'])


Dir.glob('./app/{models,helpers,controllers}/*.rb').each{ |file| require file }
Dir.glob('./lib/*.rb').each{ |file| require file }


map('/') { run ApplicationController }

