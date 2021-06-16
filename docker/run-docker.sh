#!/bin/sh

# Check if autosurvey-network network exists
if [ -z "$(docker network ls -q -f name=dmv-network)" ]; then
    docker network create autosurvey-network
fi

# rm gateway-service container if it exists
if [ -n "$(docker container ls -aqf name=dmv-service)" ]; then
    docker container stop gateway-service
    docker container rm gateway-service
fi

#start gateway-service container
docker container run -d --name gateway-service --network dmv-network \
    -p 80:8080 -e EUREKA_URL dmv/gateway-service

#Changed permission