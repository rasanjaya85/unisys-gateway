#!/usr/bin/env bash

TARGET_VERSION=$1
TOOLKIT_DIRECTORY='/home/vagrant/toolkit'
JENKINS_DIRECTORY='/var/lib/jenkins/workspace/unisys-gateway-pipeline'

echo "The build number is ", ${TARGET_VERSION}


cp -r ${JENKINS_DIRECTORY}/petstore ${TOOLKIT_DIRECTORY}/bin
cd ${TOOLKIT_DIRECTORY}/bin/


printf "Build the Product Image "
./micro-gw build petstore --deployment-config deployment.toml

if [ $? -eq 0 ]; then
   printf "Starting the rolling-update"
#    rolling update command
celse
   exit
fi

#printf "Starting the Product Container"
#PRODUCT_CONTAINER_ID=$(docker run -p 8888:8080 -d registry.wso2.org/weather-service:1.0.${TARGET_VERSION})
#
#if [ $? -eq 0 ]; then
#    printf "Starting the Zap Container"
#    ZAP_CONTAINER_ID=$(docker run -u zap -p 2375:2375 -d owasp/zap2docker-weekly zap.sh -daemon -port 2375 -host 127.0.0.1 -config api.disablekey=true -config scanner.attackOnStart=true -config view.mode=attack)
#else
#    exit
#fi

#divider==================================================================
#printf "\n"
#printf "$divider"
#printf "Rolling update process is completed."
#printf "$divider"
#printf "\n"
