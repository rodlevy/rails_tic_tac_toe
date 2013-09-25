ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)


require 'interface_controller'
require 'support/sign_in_helpers'
require 'rspec'
require 'rspec-rails'
require 'capybara'
require 'capybara/rspec'
require 'capybara/rails'

include Rails.application.routes.url_helpers

RSpec.configure do |config|
	config.include SignInHelpers
end

