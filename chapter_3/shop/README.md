# Chapter 3

# Run in docker container
docker run -itd -p 3300:3300 --name chp-3 -v "$PWD":/data -w /data ruby:2.3.3 bash
docker exec -it chp-3 bash

# Start rails server
rails s -b 0.0.0.0 -p 3300

# update
bundle update rails sass-rails
