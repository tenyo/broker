source 'https://rubygems.org'

gem 'sinatra', require: 'sinatra/base'
gem 'sinatra-contrib', require: 'sinatra/contrib/all'
gem 'logger', require: 'logger'
gem 'json', require: 'json'
gem 'data_mapper', require: 'data_mapper'
gem 'dm-migrations', require: 'dm-migrations'
gem 'rake'

group :development do
  gem 'sinatra-contrib', require: ['sinatra/contrib/all', 'sinatra/reloader']
  gem 'dm-sqlite-adapter', require: 'dm-sqlite-adapter'
end

group :test do
  gem 'rspec'
  gem 'rack-test'
end
