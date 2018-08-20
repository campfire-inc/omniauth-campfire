require "bundler/setup"
require "omniauth/campfire"

require 'simplecov'
SimpleCov.start do
  minimum_coverage(95)
end
require 'rspec'
require 'rack/test'
require 'webmock/rspec'
require 'omniauth'

RSpec.configure do |config|
  config.include WebMock::API
  config.include Rack::Test::Methods
  config.extend  OmniAuth::Test::StrategyMacros, :type => :strategy
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
