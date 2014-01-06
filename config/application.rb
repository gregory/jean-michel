require File.expand_path('../boot', __FILE__)

Bundler.require(:default, :assets, ENV['RACK_ENV'])

[
  './app/{models,helpers,controllers}/*.rb',
  './{lib,api}/**/*.rb'
].each{ |path| Dir.glob(path, &method(:require)) }

