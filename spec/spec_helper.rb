ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)


require 'interface_controller'
require 'rspec'
require 'rspec-rails'
require 'capybara'
require 'capybara/rspec'
require 'capybara/rails'
include Rails.application.routes.url_helpers
