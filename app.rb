use Rack::Auth::Basic, "Restricted Area" do |username, password|
  [username, password] == ['foo', 'keyword']
end

after "*" do
  response.headers["X-LOL"] = "Ceci n’est pas l’easter egg. Mais bel essai!"
end

# Routes {{{

get "/" do
  @title = "OpenCode Québec — 28 juillet 2011"
  haml :index
end

get "/css/screen.css" do
  scss :screen
end

get "/oc" do
  @title = "OC"
  haml :oc
end

# }}}

# Configuration {{{

configure do
  set :public, File.join(File.dirname(__FILE__), "public")
  set :haml, :format => :html5, :attr_wrapper => '"'
  set :scss, :cache_location => File.join(File.dirname(__FILE__), "tmp/sass-cache")
end

configure :development do
  set :scss, settings.scss.merge(:style => :expanded)
  set :haml, settings.haml.merge(:ugly => false)
end

configure :production do
  set :scss, settings.scss.merge(:style => :compressed)
  set :haml, settings.haml.merge(:ugly => true)
end

# }}}
