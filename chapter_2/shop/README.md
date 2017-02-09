# Chapter 2

# Run in docker container
docker run -itd -p 3200:3200 --name chp-2 -v "$PWD":/data -w /data ruby:2.3.3 bash
docker exec -it chp-2 bash

# Start rails server
rails s -b 0.0.0.0 -p 3200
