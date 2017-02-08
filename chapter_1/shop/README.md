# README

## Run in docker container
docker run -itd -p 3000:3000 --name shop -v "$PWD":/data -w /data ruby:2.3.3 bash
docker exec -it shop bash

## Start rails server
rails s -b 0.0.0.0
