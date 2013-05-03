require 'chosi'

RSpec.configure do |config|
  config.mock_framework = :mocha
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
end
