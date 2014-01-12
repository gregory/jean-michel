require File.expand_path('../boot', __FILE__)

Bundler.require(:default, :assets, ENV['RACK_ENV'])

Mongoid.load!(File.expand_path(File.join('config', 'mongoid.yml')))

[
  './{lib,domain,ports}/**/*.rb',
  './app/{models,helpers,controllers,api,commands,roles}/**/*.rb',
].each{ |path| Dir.glob(path, &method(:require)) }

