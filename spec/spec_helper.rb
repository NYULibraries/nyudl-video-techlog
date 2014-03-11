require 'awesome_print'
begin
  require 'simplecov'
  SimpleCov.start
rescue LoadError
  puts 'Coverage disabled, enable by installing simplecov'
end

%w(
   base
   time_code_29_97
   marker
   clip
   fcp
).each { |f| require_relative(File.join('..','lib','nyudl','video','techlog',f)) }

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
