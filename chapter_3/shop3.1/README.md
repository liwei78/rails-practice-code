# README

Rails 4.2 with bootswatch, and Theme `cerulean`, `united`, `simplex` installed. Just change application, have fun.

First:

`rails g bootswatch:import cerulean`

Them:

`rails g bootswatch:install cerulean`


# Fix

1. add `@zindex-modal-background: "";` to variables.less
2. add `body-padding: 60px;`

# Apply it on scaffold

`rails g scaffold product name description price:decimal`

`rails g bootswatch:themed Products`

# Run in docker container
docker run -itd -p 3301:3301 --name chp-31 -v "$PWD":/data -w /data ruby:2.3.3 bash
docker exec -it chp-31 bash

# Start rails server
rails s -b 0.0.0.0 -p 3301
