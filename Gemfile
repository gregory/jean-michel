source 'https://rubygems.org'

gem 'sinatra', '~> 1.4.4'
gem 'slim'
gem 'sinatra-asset-pipeline', require: 'sinatra/asset_pipeline'

group :development do
  gem 'shotgun'
end

group :test do
  gem 'minitest', '~> 5.2.0'
  gem 'guard'
  gem 'guard-minitest'
  gem 'capybara_minitest_spec'
end

group :test, :development do
  gem 'pry'
end

group :assets do
  gem 'sass'
  gem 'uglifier'
end
