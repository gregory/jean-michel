require File.expand_path('../boot', __FILE__)

Bundler.require(:default, :assets, ENV['RACK_ENV'])

[
  './{lib,domain}/**/*.rb',
  './app/{models,helpers,controllers,api,commands,roles}/**/*.rb',
].each{ |path| Dir.glob(path, &method(:require)) }

