require 'pry'

require_relative '../feature'
require_relative '../card'
require_relative '../deck'
require_relative '../field'

RSpec.configure do |config|
  config.filter_run_when_matching(focus: true)
  config.example_status_persistence_file_path = 'spec/examples.txt'

  config.after(:each) do
    Feature.class_variable_set :@@feature, Set.new
  end
end
