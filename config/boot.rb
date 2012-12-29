# Bundler setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
Bundler.require(:default, ENV['RACK_ENV']) if defined? Bundler

# Application setup
ENV['CANONICAL_HOST'] ||= ENV['RACK_ENV'] == 'development' ? '0.0.0.0' : 'opencode.ca'
require File.expand_path('../application',  __FILE__)
require File.expand_path('../easter_egg',  __FILE__)
