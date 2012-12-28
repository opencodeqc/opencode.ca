web: ASSETS_VERSION=`cat assets/* | md5sum | cut -d " " -f 1` bundle exec unicorn -p $PORT -c ./config/unicorn.rb -E production
