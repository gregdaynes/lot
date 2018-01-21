require 'pry'

if ENV['COVERAGE']
  require 'simplecov'

  SimpleCov.start
end

require_relative 'test_helpers'
require_relative '../feature'
require_relative '../card'
require_relative '../deck'
require_relative '../field'
require_relative '../lot'
require_relative '../player'
require_relative '../message'
require_relative '../ledger'
require_relative '../session'
require_relative '../solver'

RSpec.configure do |config|
  config.filter_run_when_matching(focus: true)
  config.example_status_persistence_file_path = 'spec/examples.txt'

  config.after(:each) do
    Feature.class_variable_set :@@feature, Set.new
  end
end
