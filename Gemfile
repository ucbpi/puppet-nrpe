source 'https://rubygems.org'

if ENV.key?('PUPPET_VERSION')
  puppetversion = "#{ENV['PUPPET_VERSION']}"
 else
   puppetversion = "~> 2.7.0"
end

gem 'rake'
gem 'puppet-lint'
gem 'rspec-puppet', '0.1.6'
gem 'puppet', puppetversion
gem 'puppetlabs_spec_helper'
