require 'simplecov'
SimpleCov.start 'rails'

RSpec.configure do |config|
  #config.before(:suite) do
    #begin
      #DatabaseCleaner.start
    #ensure
      #DatabaseCleaner.clean
    #end
  #end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end
