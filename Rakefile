task :deploy do
  sh "ssh dreamhost 'cd public/opencode.ca && git pull && touch tmp/restart.txt'"
  sh "say -v zarvox 'application deployed.'"
end
