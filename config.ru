# encoding: utf-8

require "bundler"
Bundler.require

require "logger"
require "./app"

run Sinatra::Application
