# encoding: utf-8

task :environment do
  ENV["RACK_ENV"] ||= "development"
  require File.expand_path('../config/boot',  __FILE__)
end

desc "Start a console loaded with the environment"
task :console => :environment do
  Pry.start
end
