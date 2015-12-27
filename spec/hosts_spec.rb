require 'spec_helper'

describe 'Broker::Routes::Hosts' do

  def app
    @app ||= Broker::Routes::Hosts
  end

  describe 'when GET /v1/hosts' do
    before { get '/v1/hosts' }
    subject { last_response }
    it 'status code 200' do
      expect(subject.status).to eq(200)
    end
  end

  describe 'when POST /v1/hosts' do
    before { post '/v1/hosts', {:name => "test" }.to_json, {'Content-Type' => 'application/json'} }
    subject { last_response }
    it 'status code 201' do
      expect(subject.status).to eq(201)
    end
  end

end
