require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require "rspec/rails"
require "paperclip/matchers"
require 'helpers/helper_methods'

ActiveRecord::Migration.maintain_test_schema!
DatabaseCleaner.strategy = :truncation

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.include Paperclip::Shoulda::Matchers
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.before(:all) do
    begin
      DatabaseCleaner.clean
    ensure
      DatabaseCleaner.clean
    end
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
