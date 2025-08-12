ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.

# Ruby 3.3+ compatibility: Explicitly require logger for ActiveSupport
require 'logger'
