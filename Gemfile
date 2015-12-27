source 'https://rubygems.org'

gem 'sinatra', require: 'sinatra/base'
gem 'sinatra-contrib', require: 'sinatra/contrib/all'
gem 'logger', require: 'logger'
gem 'json', require: 'json'
gem 'data_mapper', require: 'data_mapper'
gem 'dm-migrations', require: 'dm-migrations'
gem 'rake'

group :development do
  gem 'dm-sqlite-adapter', require: 'dm-sqlite-adapter'
end

group :test do
  gem 'dm-sqlite-adapter', require: 'dm-sqlite-adapter'
  gem 'rspec', require: 'rspec'
  gem 'rack-test', require: 'rack/test'
end
