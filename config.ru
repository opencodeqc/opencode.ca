# encoding: utf-8
$KCODE = "UTF8"

require "bundler"
Bundler.require

require "logger"
require "app"

run Sinatra::Application
