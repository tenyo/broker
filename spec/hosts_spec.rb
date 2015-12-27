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

  describe 'when non-existing GET /v1/hosts/555' do
    before { get '/v1/hosts/555' }
    subject { last_response }
    it 'status code 404' do
      expect(subject.status).to eq(404)
    end
  end

  describe 'when POST /v1/hosts' do
    before { post '/v1/hosts', {:name => "test" }.to_json, {'Content-Type' => 'application/json'} }
    subject { last_response }
    it 'status code 201' do
      expect(subject.status).to eq(201)
    end
  end

  describe 'when PUT /v1/hosts/1' do
    before { put '/v1/hosts/1', {:name => "test-new" }.to_json, {'Content-Type' => 'application/json'} }
    subject { last_response }
    it 'status code 200' do
      expect(subject.status).to eq(200)
    end
  end

  describe 'when existing GET /v1/hosts/1' do
    before { get '/v1/hosts/1' }
    subject { last_response }
    it 'status code 200' do
      expect(subject.status).to eq(200)
    end
  end

  describe 'when non-existing DELETE /v1/hosts/555' do
    before { delete '/v1/hosts/555' }
    subject { last_response }
    it 'status code 404' do
      expect(subject.status).to eq(404)
    end
  end

  describe 'when existing DELETE /v1/hosts/1' do
    before { delete '/v1/hosts/1' }
    subject { last_response }
    it 'status code 200' do
      expect(subject.status).to eq(200)
    end
  end

end
