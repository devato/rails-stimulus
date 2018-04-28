require 'rails_helper'

class MockRackApp
  attr_reader :request_body

  def initialize
    @request_headers = {}
  end

  def call(env)
    @env = env
    @request_body = env['rack.input'].read
    [200, { 'Content-Type' => 'text/plain' }, ['OK']]
  end

  def [](key)
    @env[key]
  end
end

describe Relay::RouteMiddleware, type: :middleware do
  let(:app)     { MockRackApp.new }
  let(:request) { Rack::MockRequest.new(subject) }
  let!(:organization) { create(:organization, name: 'findme') }

  subject { described_class.new(app) }

  context 'when no org is found in the request' do
    before do
      request.get('/notanorg', 'REQUEST_PATH' => '/notanorg')
    end
    it 'does not set the current org' do
      expect(Current.organization).to eq(nil)
    end
  end

  context 'when org is found in REQUEST_PATH' do
    before do
      request.get('/findme', 'REQUEST_PATH' => '/findme')
    end
    it 'sets the current org' do
      expect(Current.organization).to eq(organization)
    end
  end

  context 'when org is found in HTTP_REQUEST_PATH' do
    before do
      request.get('/findme', 'HTTP_REQUEST_PATH' => '/findme')
    end
    it 'sets the current org' do
      expect(Current.organization).to eq(organization)
    end
  end
end
