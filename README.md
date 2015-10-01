# deploy
Infrastructure automation code

## Prerequisites

 - Install docker: `https://docs.docker.com/installation/`
 - Install compose: `http://docs.docker.com/compose/install`

## Creating a new docker machine (do it only once)

In a shell:
 ```
 $ docker-machine create default
 $ eval "$(docker-machine env default)"
 ``` 

It's useful to add the last command to your ~/.bash_profile or ~/.zshrc (or equivalent), since it'll require each shell session to set up the docker env.

## Starting all services

In a shell:
 ```
 $ docker-machine start
 $ cd path/to/deploy
 $ docker-compose up
 ```
