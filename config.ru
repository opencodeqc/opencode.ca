# encoding: utf-8

require "bundler"
Bundler.require
require "./app"

map "/assets" do
  sprockets = Sprockets::Environment.new.tap do |s|
    s.append_path File.join(File.dirname(__FILE__), 'assets', 'stylesheets')
    s.append_path File.join(File.dirname(__FILE__), 'assets', 'images')

    Sprockets::Helpers.configure do |config|
      config.environment = s
      config.prefix = "/assets"
      config.digest = true
    end
  end

  run sprockets
end

map "/" do
  run OpenCode::App
end

