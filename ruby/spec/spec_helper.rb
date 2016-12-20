require_relative '../bootstrap'

require 'rspec'
require 'byebug'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    # Makes the `description` and `failure_message` of custom matchers include
    # text for helper methods defined using `chain`, e.g.:
    #     be_bigger_than(2).and_smaller_than(4).description
    #     # => 'be bigger than 2 and smaller than 4'
    # ...rather than:
    #     # => 'be bigger than 2'
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist
    mocks.verify_partial_doubles = true
  end

  # Causes shared context metadata to be inherited by the metadata hash of host
  # groups and examples, rather than triggering implicit auto-inclusion in
  # groups with matching metadata.
  config.shared_context_metadata_behavior = :apply_to_host_groups

  # Only run tests tagged with :focus
  config.filter_run_when_matching :focus

  # Limits the available syntax to the non-monkey patched syntax that is
  # recommended
  config.disable_monkey_patching!

  # Print the 10 slowest examples and example groups at the end of the spec run
  # config.profile_examples = 10

  # Run specs in random order to surface order dependencies
  config.order = :random

  # Seed global randomization in this process using the `--seed` CLI option
  Kernel.srand config.seed
end
