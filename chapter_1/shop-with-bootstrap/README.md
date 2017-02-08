# Shop with bootstrap

## Run in docker container
docker run -itd -p 3001:3001 --name shop-with-bootstrap -v "$PWD":/data -w /data ruby:2.3.3 bash
docker exec -it shop-with-bootstrap bash

## Start rails server
rails s -b 0.0.0.0 -p 3001
