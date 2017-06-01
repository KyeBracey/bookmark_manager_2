ENV['RACK_ENV'] = "test"
require 'capybara/rspec'
require 'sinatra'
require './app/app'
require 'database_cleaner'
require 'feature/web_helpers.rb'


Capybara.app = BookmarkManager

RSpec.configure do |config|

config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.start
  end

end
