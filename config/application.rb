module OpenCode
  class App < Sinatra::Base
    register Sinatra::R18n
    register Sinatra::Partial
    enable :partial_underscores

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
    helpers Sprockets::Helpers
    helpers Sinatra::ContentFor

    # Routes
    before do
      future_editions, @past_editions = Edition.all.partition { |e| e.held_at.getutc > Time.now.utc }
      @future_edition = future_editions.first
    end

    get(%r{^/$}) { params[:locale] = "fr"; haml :"index-fr" }
    get(%r{^/(?<locale>en)$}) { haml :"index-en" }
  end
end
