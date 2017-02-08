# Shop with bootswatch

# Run in docker container
docker run -itd -p 3002:3002 --name shop-with-bootswatch -v "$PWD":/data -w /data ruby:2.3.3 bash
docker exec -it shop-with-bootswatch bash

# Start rails server
rails s -b 0.0.0.0
