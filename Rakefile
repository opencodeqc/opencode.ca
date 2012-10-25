desc "Deploy the website"
task :deploy do # {{{
  sh "ssh dreamhost 'export PATH=\"$HOME/bin:/usr/lib/ruby/gems/1.8/bin:$PATH\" && cd public/opencode.ca && git pull && rake build'"
  sh "say -v zarvox 'application deployed.'"
end # }}}

desc "Build the static HTML file"
task :build do # {{{
  sh "rm -fr _static"
  sh "mkdir -p _static/css"
  sh "mkdir -p _static/en"
  sh "bundle exec haml --format=html5 --double-quote-attributes views/index.haml _static/index.html"
  sh "bundle exec haml --format=html5 --double-quote-attributes views/index-en.haml _static/en/index.html"
  sh "bundle exec sass --scss --style=compressed views/screen.scss _static/css/screen.css"
  sh "cp -r public/* _static"
end # }}}
