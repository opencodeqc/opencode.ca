# encoding: utf-8

task :environment do
  ENV["RACK_ENV"] ||= "development"
  require File.expand_path('../config/boot',  __FILE__)
end

desc "Start a console loaded with the environment"
task :console => :environment do
  Pry.start
end

desc "Fetch speaker avatar images"
task :sync_avatars => :environment do
  PARSE_COMMAND = 'curl -s "https://twitter.com/%s" | grep ProfileAvatar-image'.freeze
  FETCH_COMMAND = 'wget %s -O %s'.freeze

  YAML.load_file('data/speakers.yml').each do |speaker|
    screenname = speaker[:screenname]
    next unless screenname

    puts "Fetching image for #{screenname}"
    result = `#{PARSE_COMMAND % screenname}`
    match_data = result.match(/src=\"(?<url>[^"]+)\"/)

    if match_data
      image_url = match_data[:url]
      file_path = "app/assets/images/speakers/#{screenname}#{File.extname(image_url)}".downcase
      puts "Downloading #{image_url} to #{file_path}"

      system(FETCH_COMMAND % [image_url, file_path])
    else
      puts "There was no image found for #{screenname}"
    end
  end
end
