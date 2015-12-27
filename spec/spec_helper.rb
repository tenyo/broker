require 'bundler/setup'
Bundler.require :default, :test

require File.join(File.dirname(__FILE__), '..', 'app.rb')

Sinatra::Base.set :environment, :test
Sinatra::Base.set :run, false
Sinatra::Base.set :raise_errors, true
Sinatra::Base.set :logging, false

RSpec.configure do |config|
  config.include Rack::Test::Methods
  # use in-memory database for testing
  DataMapper.setup(:hostsdb, "sqlite::memory:")
  DataMapper.finalize
  Host.auto_migrate!
end

