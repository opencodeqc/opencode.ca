# encoding: utf-8

require "bundler"
Bundler.require
require "./app"

run Sinatra::Application
