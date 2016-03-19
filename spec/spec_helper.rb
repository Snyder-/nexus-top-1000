require_relative '../character_list'

require 'pp'
require 'timecop'
require 'factory_girl'

FactoryGirl.find_definitions
include RSpec::Expectations

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
end
