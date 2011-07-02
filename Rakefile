task :deploy do
  sh "ssh dreamhost 'cd public/misc.exomel.com && git pull && touch tmp/restart.txt'"
  sh "say -v zarvox 'application deployed.'"
end
