module OpenCode
  class App < Sinatra::Base
    register Sinatra::R18n

    # Configuration
    configure do
      set :root, -> { File.expand_path("./") }
      set :views, -> { File.join(root, "app/views") }
      set :public_folder, -> { File.join(root, "public") }
      set :haml, :format => :html5, :attr_wrapper => '"', :ugly => true
      use Rack::CanonicalHost, ENV['CANONICAL_HOST']
    end

    configure :development do
      register Sinatra::Reloader
    end

    # Filters (Easter Egg hint)
    after("*") { response.headers["X-Easter-Egg"] = "GET /foo" }

    # Helpers
    helpers Sprockets::Helpers

    # Routes
    before do
      @editions = Edition.all
      future_editions, @past_editions = @editions.partition { |e| e.held_at.getutc > Time.now.utc }
      @future_edition = future_editions.first

      params[:locale] = "fr"
    end

    get("/") { haml :index }

    get "/leaderboard" do
      h = Hash.new(0)
      Talk.all.each do |talk|
        next if talk.edition_id == @future_edition.id
        h[talk.author_name] += 1
      end

      @authors = h.sort_by {|k, v| -v}
      haml :leaderboard
    end
  end
end
