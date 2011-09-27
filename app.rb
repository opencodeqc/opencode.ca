# Filters {{{

after "*" do
  response.headers["X-LOL"] = "Ceci n’est pas l’easter egg. Mais bel essai quand même!"
end

# }}}

# Routes {{{

get "/" do
  @title = "OpenCode Québec — 29 septembre 2011"
  haml :index
end

get "/css/screen.css" do
  scss :screen
end

get "/oc" do
  @title = "OC"
  haml :oc
end

get "/foo" do
  @step = 0
  headers "Content-Type" => "text/plain; charset=UTF-8"
  settings.steps.each_with_index do |value, index|
    break unless request.env["HTTP_X_OPENCODE_#{index+1}"] == value
    @step = index + 1
  end
  haml :foo, :layout => false
end


# }}}

# Configuration {{{

configure do
  set :public, File.join(File.dirname(__FILE__), "public")
  set :haml, :format => :html5, :attr_wrapper => '"'
  set :scss, :cache_location => File.join(File.dirname(__FILE__), "tmp/sass-cache")

  set :steps, ["3828", "1995-09-22", "T_PAAMAYIM_NEKUDOTAYIM", "☃", "b2d4e6fc4f19", "2"]
end

configure :development do
  set :scss, settings.scss.merge(:style => :expanded)
  set :haml, settings.haml.merge(:ugly => false)
end

configure :production do
  set :scss, settings.scss.merge(:style => :compressed)
  set :haml, settings.haml.merge(:ugly => false)
end

# }}}
