module OpenCode
  class App < Sinatra::Base
    # Configuration
    configure do
      set :root, -> { File.expand_path("./") }
      set :views, -> { File.join(root, "app/views") }
      set :public_folder, -> { File.join(root, "public") }
      set :haml, :format => :html5, :attr_wrapper => '"', :ugly => true
      use Rack::CanonicalHost, ENV['CANONICAL_HOST']
    end

    # Filters (Easter Egg hint)
    after("*") { response.headers["X-Easter-Egg"] = "GET /foo" }

    # Helpers
    helpers { include Sprockets::Helpers }

    # Routes
    get("/") { haml :index }
    get("/en") { haml :"index-en" }
  end
end
