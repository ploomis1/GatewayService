#!/bin/sh

# Check if autosurvey-network network exists
if [ -z "$(docker network ls -q -f name=autosurvey-network)" ]; then
    docker network create autosurvey-network
fi

# rm gateway-service container if it exists
if [ -n "$(docker container ls -aqf name=gateway-service)" ]; then
    docker container stop gateway-service
    docker container rm gateway-service
fi

#start gateway-service container
docker container run -d --name gateway-service --network autosurvey-network \
    -p 80:8080 -e EUREKA_URL autosurvey/gateway-service

#Changed permission