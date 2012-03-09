desc "Deploy the website"
task :deploy do # {{{
  sh "ssh dreamhost 'cd public/opencode.ca && git pull && touch tmp/restart.txt'"
  sh "say -v zarvox 'application deployed.'"
end # }}}

desc "Build the static HTML file"
task :build do # {{{
  sh "mkdir -p _static/css"
  sh "bundle exec haml --format html5 views/index.haml _static/index.html"
  sh "bundle exec sass --scss views/screen.scss _static/css/screen.css"
  sh "cp -r public/img _static"
end # }}}
