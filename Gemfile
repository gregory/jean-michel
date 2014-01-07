source 'https://rubygems.org'

ruby '1.9.3'

gem 'sinatra', '~> 1.4.4'
gem 'slim'
gem 'sinatra-asset-pipeline', require: 'sinatra/asset_pipeline'
gem 'grape'
gem "roar", require: [ 'roar/representer/json', 'roar/decorator', 'roar/representer/json/hal' ]
gem "virtus"

group :development do
  gem 'shotgun'
end

group :test do
  gem 'minitest', '~> 5.2.0'
  gem 'guard'
  gem 'guard-minitest'
  gem 'capybara_minitest_spec'
  gem 'faker', '~> 1.2.0'
end

group :test, :development do
  gem 'rake'
  gem 'pry'
end

group :assets do
  gem 'sass'
  gem 'uglifier'
end
