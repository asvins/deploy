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
 $ ./up.sh
 ```

## The up.sh script

This script will make sure that zookeeper and kafka are up before all other containers.
Also, it will create all topics listed in 'topics' file before initializing the other containers.
To add more topics, just add another line on 'topics' file and run:

```
	$ ./create_topics.sh
```

or just execute:

```
	$ ./up.sh
```
