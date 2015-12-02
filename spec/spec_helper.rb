require 'mars_explorer'
require 'rack/test'
require 'rspec'

ENV['RACK_ENV'] = 'test'

def app
  MarsExplorer::App
end

RSpec.configure do |c|
  c.include Rack::Test::Methods
  c.add_formatter 'documentation'
  c.color = true
end
