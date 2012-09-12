# encoding: utf-8
require "base64"

# Filters {{{

after "*" do
  response.headers["X-LOL"] = "Ceci n’est pas l’easter egg. Mais bel essai quand même!"
end

# }}}

# Routes {{{

get "/" do
  haml :index, :layout => false
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
  headers "Content-Type" => "application/json; charset=UTF-8"
  settings.steps.each_with_index do |value, index|
    answer, @clue = value
    break unless request.env["HTTP_X_OPENCODE_#{index+1}"] == answer
    @step = index + 1
  end

  output = {}
  if @step == settings.steps.length
    output = { :message => "Le mot à crier fièrement est « YATTA »." }
  else
    output = { :clue => @clue, :header => "X-opencode-#{@step+1}" }
  end

  JSON.dump output
end

# }}}

# Configuration {{{

configure do
  set :public, File.join(File.dirname(__FILE__), "public")
  set :haml, :format => :html5, :attr_wrapper => '"'
  set :scss, :cache_location => File.join(File.dirname(__FILE__), "tmp/sass-cache")

  set :steps, [
    ["3828", "La somme de tous les nombres entre 1 et 87, inclusivement."],
    ["1995-09-22", "La date (YYYY-MM-DD) de la publication de la spec HTML 2.0."],
    ["memoization", "Le nom du procédé (en anglais) qui consiste à éviter de répeter un calcul résultant d'un appel de fonction."],
    ["T_PAAMAYIM_NEKUDOTAYIM", "Le nom de la constante en PHP qui désigne des « deux points » doubles."],
    ["418", "Code d’erreur de la théière."],
    ["2", "En Javascript, le résultat de : 1 + - + + + - + 1"],
    ["NaN", "SmUgbmUgc3VpcyBwYXMgdW4gbm9tYnJlLg=="],
    ["☃", "Le caractère Unicode U+2603."],
    ["b2d4e6fc4f19", "Le hash du commit de Guido van Rossum dans CPython du 10:33:38 2011 -0700."],
  ]
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
