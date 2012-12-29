# encoding: utf-8

module OpenCode
  class App < Sinatra::Base
    # Configuration
    configure do
      set :root, -> { File.dirname(__FILE__) }
      set :views, -> { File.join(root, "app/views") }
      set :public_folder, -> { File.join(root, "public") }
      set :haml, :format => :html5, :attr_wrapper => '"', :ugly => true
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
