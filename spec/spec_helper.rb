# This file was generated by the `rspec --init` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# Require this file using `require "spec_helper.rb"` to ensure that it is only
# loaded once.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  load "spec/acceptance/roles/test_user.rb"
  Dir["spec/acceptance/roles/**/*.rb"].each {|f| load f}

  module MockConst
    def mock_const(scope, const, &block)
      before do
        const_val = mock
        instance_exec(const_val, &block)
        scope.send(:const_set, const, const_val)
        self.class.const_set(const, const_val)
      end
      after do
        scope.send(:remove_const, const)
        self.class.send(:remove_const, const)
      end
    end
  end
  config.extend MockConst
end
