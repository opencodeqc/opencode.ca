# encoding: utf-8

module OpenCode
  class App < Sinatra::Base
    # Configuration
    configure do
      set :public_folder, File.join(File.dirname(__FILE__), "public")
      set :haml, :format => :html5, :attr_wrapper => '"'
      set :scss, :cache_location => File.join(File.dirname(__FILE__), "tmp/sass-cache")
      set :haml, settings.haml.merge(:ugly => true)
    end

    # Helpers
    helpers { include Sprockets::Helpers }

    # Filters
    after("*") { response.headers["X-LOL"] = "GET /foo" }

    # Routes
    get("/") { haml :index }
    get("/en") { haml :"index-en" }

    # Easter Egg
    require "./easter_egg"
  end
end
