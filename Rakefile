task :deploy do
  sh "ssh dreamhost 'cd public/opencode.ca && git pull && touch tmp/restart.txt'"
  sh "say -v zarvox 'application deployed.'"
end

task :build do
  sh "bundle exec haml --format html5 views/index.haml _static/index.html"
  sh "bundle exec sass --scss views/screen.scss _static/css/screen.css"
end
