# encoding: utf-8

require "bundler"
Bundler.require

require "logger"
require "base64"
require 'sass/plugin/rack'
require "./app"

run Sinatra::Application
