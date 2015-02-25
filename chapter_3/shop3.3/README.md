## README

Rails 4.2.0 with bootswatch, and Theme `cerulean`, `united`, `simplex` installed. Just change application, have fun.

First:

`rails g bootswatch:import cerulean`

Them:

`rails g bootswatch:install cerulean`


## Fix

1. add `@zindex-modal-background: "";` to variables.less
2. add `body-padding: 60px;`

## Apply it on scaffold

`rails g scaffold product name description price:decimal`

`rails g bootswatch:themed Products`

Rique LI
