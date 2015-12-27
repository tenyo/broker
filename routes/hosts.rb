module Broker
  module Routes
    class Hosts < Sinatra::Base

      configure do
        set :root, App.root
        register Sinatra::Namespace
      end

      before do
        content_type :json
      end

      namespace '/v1/hosts' do

        get '' do
          Host.all.to_json
        end

        get '/:id' do
          t = Host.get(params[:id])
          if t.nil?
            halt 404
          end
          t.to_json
        end
        
        post '' do
          body = JSON.parse request.body.read
          if body['name'].nil?
            halt 500, 'Name not specified!'
          end
          t = Host.create(
            name:       body['name'],
            created_at: Time.now,
            updated_at: Time.now
          )
          status 201
          t.to_json 
        end

        put '/:id' do
          body = JSON.parse request.body.read
          t = Host.get(params[:id])
          if t.nil?
            halt 404
          end
          halt 500 unless t.update(
            name:       body['name'],
            updated_at: Time.now
          )
          t.to_json
        end
        
        delete '/:id' do
          t = Host.get(params[:id])
          if t.nil?
            halt 404
          end
          halt 500 unless t.destroy
        end

      end

    end
  end
end
