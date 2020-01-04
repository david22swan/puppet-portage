source ENV['GEM_SOURCE'] || 'https://rubygems.org'

ruby ">= 2.3.1"

if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', :require => false
end

gem 'puppetlabs_spec_helper', '>= 1.2.0'
gem 'facter', '>= 1.7.0'
gem 'rspec-puppet'
gem 'rspec-collection_matchers'
gem 'semantic_puppet'
gem 'puppet-lint', '~> 2.0'
gem 'puppet-lint-absolute_classname-check'
gem 'puppet-lint-alias-check'
gem 'puppet-lint-empty_string-check'
gem 'puppet-lint-file_ensure-check'
gem 'puppet-lint-file_source_rights-check'
gem 'puppet-lint-leading_zero-check'
gem 'puppet-lint-spaceship_operator_without_tag-check'
gem 'puppet-lint-trailing_comma-check'
gem 'puppet-lint-undef_in_function-check'
gem 'puppet-lint-unquoted_string-check'
gem 'puppet-lint-variable_contains_upcase'

gem 'rspec', :require => false
gem 'rake', :require => false
gem 'metadata-json-lint', :require => false
gem 'mocha', :require => false
