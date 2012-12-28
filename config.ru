# encoding: utf-8

require "bundler"
Bundler.require
require "./app"

map "/assets" do
  run (Sprockets::Environment.new.tap { |s|
    s.append_path File.join(File.dirname(__FILE__), 'assets', 'stylesheets')

    Sprockets::Helpers.configure do |config|
      config.environment = s
      config.prefix = "/assets"
      config.digest = true
    end
  })
end

map "/" do
  run Sinatra::Application
end

