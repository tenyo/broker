module Broker
  class App < Sinatra::Application

    register Sinatra::Contrib

    set :logging, true

    configure :development do
      Bundler.require :development
      register Sinatra::Reloader
      disable :show_exceptions
      set :logging, Logger::DEBUG
      DataMapper::Logger.new($stdout, :debug)
    end

    Dir['./models/*.rb'].each { |file| require file }
    Dir['./routes/*.rb'].each { |file| require file }

    # mount all routes you wish to use
    use Routes::Hosts

    # Error Handling
    not_found do
      { status: 404, message: 'Not Found' }.to_json
    end

  end
end
