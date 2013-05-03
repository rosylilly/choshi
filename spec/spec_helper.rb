require 'coveralls'
Coveralls.wear!

require 'simplecov'
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start do
  add_filter "/spec/dummy"
end

$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rails'
require 'choshi'

require 'dummy/application'
require 'rspec/rails'

RSpec.configure do |config|
  config.mock_framework = :mocha
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.before(:suite) do
    CreateTables.up
  end

  config.after(:each) do
    User.delete_all
  end
end
