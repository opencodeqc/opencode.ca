# encoding: utf-8

module OpenCode
  class App < Sinatra::Base
    # Configuration
    configure(:development) { set :canonical_host, "localhost" }
    configure(:production) { set :canonical_host, "opencode.ca" }

    configure do
      set :root, -> { File.dirname(__FILE__) }
      set :views, -> { File.join(root, "app/views") }
      set :public_folder, -> { File.join(root, "public") }
      set :haml, :format => :html5, :attr_wrapper => '"', :ugly => true
      use Rack::CanonicalHost, settings.canonical_host
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
