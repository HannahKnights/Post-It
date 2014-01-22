ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara'
require 'database_cleaner'
require 'factory_girl'

Dir[Rails.root.join("spec/factories/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|

include Warden::Test::Helpers
include FactoryGirl::Syntax::Methods

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_base_class_for_anonymous_controllers = false

  config.order = "random"

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
    Warden.test_mode!
  end

  config.before(:each) do
    DatabaseCleaner.start
    Warden.test_reset!
  end

  config.filter_run_excluding slow: true

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
